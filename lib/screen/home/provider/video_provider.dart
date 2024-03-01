import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
String path="assets/video/1.mp4";
class VideoProvider with ChangeNotifier
{
  VideoPlayerController main =VideoPlayerController.asset(path)..initialize().then((value) => null);
void change()
{
  path="assets/video/2.mp4";
  notifyListeners();
}
void noChange()
{
  path="assets/video/1.mp4";
  notifyListeners();
}
}