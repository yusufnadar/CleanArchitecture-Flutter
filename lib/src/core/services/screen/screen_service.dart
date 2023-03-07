import 'package:flutter/services.dart';

class ScreenService {
  ScreenService._init();

  static final ScreenService _instance = ScreenService._init();

  static ScreenService get instance => _instance;

  Future screenVertical() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  Future screenHorizontal() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
    );
  }

  Future screenRight() async {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight],
    );
  }

  Future screenLeft() async {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft],
    );
  }
}
