import 'dart:ui';
import 'package:flutter/material.dart';

import 'flappyBirdd.dart';

class Bird{
  FlappyBird game;
  Rect bird;
  Paint birdColor;
  double birdSize ;
  static double jump=0.0;
  Bird(this.game,double y){
    birdSize=game.tileSize;

    bird= Rect.fromLTWH((game.screenSize.width-birdSize)/2, y, game.tileSize, game.tileSize);
    birdColor=Paint()..color=Colors.red;

  }
  render(Canvas c){
    c.drawRect(bird, birdColor);
  }

  update(){

  }

}