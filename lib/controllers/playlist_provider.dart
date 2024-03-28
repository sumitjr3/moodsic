import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moodsic/controllers/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  String themeName;
  //constructor
  PlaylistProvider(this.themeName) {
    listenToDuration();
    fetchPlaylist();
  }

  //list of songs
  final List<Songs> _playlist = [
    // Songs(
    //     songName: 'tune 1',
    //     songTrackPath:
    //         'https://firebasestorage.googleapis.com/v0/b/moodsic-97119.appspot.com/o/tunes%2FchillTunes%2F1%2Fmp3%2Fdreamscape-soul-relaxing-cinematic-background-music-for-videos-155186.mp3?alt=media&token=9c894e1f-b020-494a-b548-5794fdc391db',
    //     songImagePath: 'lib/assets/images/img1.png'),
    // Songs(
    //     songName: 'tune 2',
    //     songTrackPath:
    //         'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    //     songImagePath: 'lib/assets/images/img2.png'),
    // Songs(
    //     songName: 'tune 3',
    //     songTrackPath:
    //         'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    //     songImagePath: 'lib/assets/images/img3.png'),
    // Songs(
    //     songName: 'tune 4',
    //     songTrackPath:
    //         'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    //     songImagePath: 'lib/assets/images/img4.png'),
    // Songs(
    //     songName: 'tune 5',
    //     songTrackPath: 'lib/assets/tunes/tune1.mp3',
    //     songImagePath: 'lib/assets/images/img5.png'),
    // Songs(
    //     songName: 'tune 6',
    //     songTrackPath: 'lib/assets/tunes/tune1.mp3',
    //     songImagePath: 'lib/assets/images/img6.png'),
    // Songs(
    //     songName: 'tune 7',
    //     songTrackPath: 'lib/assets/tunes/tune1.mp3',
    //     songImagePath: 'lib/assets/images/img7.png'),
    // Songs(
    //     songName: 'tune 8',
    //     songTrackPath: 'lib/assets/tunes/tune1.mp3',
    //     songImagePath: 'lib/assets/images/img8.png'),
  ];

  Future<void> fetchPlaylist() async {
    final DatabaseReference dbRef =
        FirebaseDatabase.instance.ref().child('playlists').child(themeName);
    final DataSnapshot snapshot = await dbRef.get();

    if (snapshot.value != null) {
      List<dynamic> playlistData = snapshot.value as List<dynamic>;

      _playlist.clear(); // Clear the previous playlist data

      for (var songData in playlistData) {
        final Songs song = Songs(
          songName: songData['title'],
          songImagePath: songData['cover_image'],
          songTrackPath: songData['mp3_url'],
        );
        _playlist.add(song);
      }

      notifyListeners(); // Trigger a rebuild of the widget to display the updated playlist
    } else {
      print('Error: playlist data is null');
    }
  }

  /* Audio Player */
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //current song playlist
  int? _currentSongIndex;

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].songTrackPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume playing
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific posistion in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if the song is last, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }
    //if its within first 2 seconds of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if it is first song then hoop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    // listen for totl duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song complete
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //dispose audio player
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  //getters
  List<Songs> get playList => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters
  set currentSongIndex(int? newIndex) {
    //update current
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    //update ui
    notifyListeners();
  }
}
