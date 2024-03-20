import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moodsic/controllers/playlist_provider.dart';
import 'package:moodsic/controllers/songs.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:moodsic/views/detailed_music_player.dart';
import 'package:moodsic/widgets/mycard.dart';
import 'package:provider/provider.dart';

class tunesView extends StatefulWidget {
  tunesView({super.key});

  @override
  State<tunesView> createState() => _tunesViewState();
}

class _tunesViewState extends State<tunesView> {
  late PlaylistProvider playlistProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  @override
  void initState() {
    super.initState();
  }

  void goToSong(int currentIndex) {
    //update the song index
    playlistProvider.currentSongIndex = currentIndex;

    //navigate to the detailed screen
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 2),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DetailedMusicPlayer(),
        // builder: (context) => const DetailedMusicPlayer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.secondary,
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          //get the playlist
          final List<Songs> playlist = value.playList;

          //return liour cardview
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1 / 1.25,
              ),
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                //get the individual song
                final Songs song = playlist[index];

                return InkWell(
                  onTap: () {
                    goToSong(index);
                  },
                  child: Hero(
                    tag: 'animation',
                    child: myCard(
                        color: themeProvider.currentTheme.colorScheme.primary,
                        textColor:
                            themeProvider.currentTheme.colorScheme.secondary,
                        text: song.songName,
                        imagePath: song.songImagePath),
                  ),
                );
              },
              padding: const EdgeInsets.all(10),
            ),
          );
        },
      ),
    );
  }
}
