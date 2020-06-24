import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'flappyBirdd.dart';
import 'package:flutter/gestures.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  flameUtil.fullScreen();
  flameUtil.setOrientation(DeviceOrientation.portraitUp);

  FlappyBird game = FlappyBird();
  runApp(game.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown=game.onTapDown ;
  tapper.onTapUp=game.onTapUp;
  flameUtil.addGestureRecognizer(tapper);


}
