import 'package:flutter/material.dart';

class DetailedMusicPlayer extends StatelessWidget {
  const DetailedMusicPlayer({
    super.key,
    required this.title,
    required this.imagepath,
    required this.text,
    required this.trackpath,
  });
  final String title;
  final String imagepath;
  final String text;
  final String trackpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Card(
          shadowColor: Colors.deepPurple[400],
          margin: const EdgeInsets.all(20),
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: AlignmentDirectional.center,
                child: Image(
                  image: AssetImage(imagepath),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_left_rounded),
                        iconSize: 50),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.pause_circle),
                      iconSize: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_right_alt_rounded),
                      iconSize: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
