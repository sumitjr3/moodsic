import 'package:flutter/material.dart';
import 'package:moodsic/controllers/playlist_provider.dart';
import 'package:moodsic/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class DetailedMusicPlayer extends StatefulWidget {
  const DetailedMusicPlayer({
    super.key,
  });

  @override
  State<DetailedMusicPlayer> createState() => _DetailedMusicPlayerState();
}

class _DetailedMusicPlayerState extends State<DetailedMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        //get curent playlist
        final playlist = value.playList;

        //current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];
        final themeprovider = ThemeProvider.of(context);
        return Scaffold(
          backgroundColor: themeprovider.currentTheme.colorScheme.primary,
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                        ),
                      ),
                      Text(
                        themeprovider.currentThemeName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 1,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Card(
                    color: themeprovider.currentTheme.colorScheme.secondary,
                    shadowColor: Colors.black,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        //image
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Hero(
                            tag: 'animation',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: AssetImage(currentSong.songImagePath),
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 0),
                        //tune name
                        Text(
                          currentSong.songName,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 6),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {
                          value.seek(Duration(seconds: double.toInt()));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: themeprovider.currentTheme.colorScheme.secondary,
                    shadowColor: Colors.black,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        //play, pause, next and previous layout
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: value.playPreviousSong,
                                  child: const Icon(
                                    Icons.skip_previous,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: value.pauseOrResume,
                                  child: Icon(
                                    value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: value.playNextSong,
                                  child: const Icon(
                                    Icons.skip_next,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
