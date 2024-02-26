import 'package:flutter/material.dart';
import 'package:moodsic/models/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Songs> _playlist = [
    Songs(
        songName: 'tune 1',
        songTrackPath: 'lib/assets/tunes/tune1.mp3',
        songImagePath: 'lib/assets/images/img1.png'),
    Songs(
        songName: 'tune 2',
        songTrackPath: 'lib/assets/tunes/tune2.mp3',
        songImagePath: 'lib/assets/images/img2.png'),
    Songs(
        songName: 'tune 3',
        songTrackPath: 'lib/assets/tunes/tune3.mp3',
        songImagePath: 'lib/assets/images/img3.png'),
    Songs(
        songName: 'tune 4',
        songTrackPath: 'lib/assets/tunes/tune4.mp3',
        songImagePath: 'lib/assets/images/img4.png'),
    Songs(
        songName: 'tune 5',
        songTrackPath: 'lib/assets/tunes/tune5.mp3',
        songImagePath: 'lib/assets/images/img5.png'),
    Songs(
        songName: 'tune 6',
        songTrackPath: 'lib/assets/tunes/tune6.mp3',
        songImagePath: 'lib/assets/images/img6.png'),
    Songs(
        songName: 'tune 7',
        songTrackPath: 'lib/assets/tunes/tune7.mp3',
        songImagePath: 'lib/assets/images/img7.png'),
    Songs(
        songName: 'tune 8',
        songTrackPath: 'lib/assets/tunes/tune8.mp3',
        songImagePath: 'lib/assets/images/img8.png'),
  ];

  //current song playlist
  int? _currentSongIndex;

  //getters
  List<Songs> get playList => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //setters
  set currentSongIndex(int? newIndex) {
    //update current
    _currentSongIndex = newIndex;

    //update ui
    notifyListeners();
  }
}
