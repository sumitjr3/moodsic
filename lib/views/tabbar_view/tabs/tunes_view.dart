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
    playlistProvider = PlaylistProvider();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Access the selected theme from the provider
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      backgroundColor: themeProvider.currentTheme.colorScheme.background,
      body: Consumer<PlaylistProvider>(
        builder: (context, playlistProvider, child) {
          //get the playlist
          final List<Songs> playlist = playlistProvider.playList;

          //return liour cardview
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1 / 1.22,
              ),
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                //get the individual song
                final Songs song = playlist[index];
                if (playlistProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      playlistProvider.currentSongIndex = index;
                      //navigate to the detailed screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedMusicPlayer(
                            currentIndex: index,
                          ),
                        ),
                      );
                    },
                    child: myCard(
                      color: themeProvider.currentTheme.colorScheme.primary,
                      textColor:
                          themeProvider.currentTheme.colorScheme.secondary,
                      text: song.songName,
                      imagePath: song.songImagePath,
                    ),
                  );
                }
              },
              padding: const EdgeInsets.all(10),
            ),
          );
        },
      ),
    );
  }
}
