import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_6099/screen/home/provider/video_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    VideoProvider providerR=context.read<VideoProvider>();
   VideoProvider providerW=context.watch<VideoProvider>();
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Video Player"),),
      body: InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) =>Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(color: Colors.transparent,child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                        providerW.main.value.isPlaying
                            ? providerR.main.pause()
                            : providerR.main.play();
                        Navigator.pop(context);
                    },
                    icon: Icon(
                      color: Colors.white,
                      providerW.main.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      path=="assets/video/1.mp4"
                          ?providerR.change():
                      providerR.noChange();
                      Navigator.pop(context);
                    },
                    icon: Icon(
                        color: Colors.white,
                        Icons.skip_next
                    ),
                  ),
                ],
              ),),
            ],
          )),);
        },
        child: Center(
          child: AspectRatio(aspectRatio: providerR.main.value.aspectRatio,
          child: VideoPlayer(providerR.main),),
        ),
      ),
    ));
  }
}
