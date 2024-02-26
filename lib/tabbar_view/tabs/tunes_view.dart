import 'package:flutter/material.dart';
import 'package:moodsic/constants/routes.dart';
import 'package:moodsic/models/playlist_provider.dart';
import 'package:moodsic/models/songs.dart';
import 'package:moodsic/theme/app_theme.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/detailed_music_player.dart';
import 'package:moodsic/widgets/mycard.dart';
import 'package:provider/provider.dart';

class tunesView extends StatefulWidget {
  const tunesView({super.key});

  @override
  State<tunesView> createState() => _tunesViewState();
}

class _tunesViewState extends State<tunesView> {
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int currentIndex) {
    //update the song index
    playlistProvider.currentSongIndex = currentIndex;

    //navigate to the detailed screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedMusicPlayer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.primary,
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Songs> playlist = value.playList;

          //return liour cardview
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              //get the individual song
              final Songs song = playlist[index];

              return GestureDetector(
                onTap: () {
                  goToSong(index);
                },
                child: myCard(
                    color: themeProvider.currentTheme.colorScheme.secondary,
                    textColor: themeProvider.currentTheme.colorScheme.primary,
                    text: song.songName,
                    imagePath: song.songImagePath),
              );
            },
            padding: const EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}
