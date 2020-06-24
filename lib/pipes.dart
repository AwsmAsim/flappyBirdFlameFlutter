import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

import 'flappyBirdd.dart';
const kgap = 200;

 class Pipes{
   FlappyBird game;
   Rect pipe1;
   Rect pipe2;
   Paint pipeColor;
   Random rnd;
   double randomNumberObtained;
   double x1=0;
   static double randomNo;


   Pipes(this.game,double x){
     pipe1= Rect.fromLTWH(x-x1, -(randomNo*game.screenSize.height+100) , 100, game.screenSize.height);

     pipe2= Rect.fromLTWH(x-x1, pipe1.bottom+kgap , 100, game.screenSize.height);
     pipeColor=Paint()..color=Colors.green;

   }
   void render(Canvas c)
   {
     x1=x1+10;

     c.drawRect(pipe1, pipeColor);
     c.drawRect(pipe2, pipeColor);

   }
   void update(double d){

   }

 }