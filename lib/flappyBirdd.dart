import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:sampleflappy/bird.dart';
import 'pipes.dart';
import 'dart:math';
class FlappyBird extends Game{

  Size screenSize;
  double doubleScreenSize;
  double tileSize;
  Bird bird;
  Random rnd;
  double position=null;
  double speed = 0;
  bool jump=false;
  double xPipeMove=null;
  Pipes pipe;
  double lastMovement=0;
  void initialise() async{
    resize(await Flame.util.initialDimensions());
    rnd = Random();
    Pipes.randomNo=rnd.nextDouble();

    pipe=Pipes(this,200);
   // pipe.randomNo(rnd.nextDouble());
  }
   void randomPipe(){
     rnd = Random();
     Pipes.randomNo=rnd.nextDouble();

   }
  FlappyBird(){
    initialise();
  }
  void resize(Size size){
    screenSize=size;
    tileSize=screenSize.height/12;

  }
  double bPosition(){
    if(jump){

       position = position-10;//+speed;
       speed=0;
       return position;

    }else {
      if (position == null) {
        position = (screenSize.height - tileSize) / 2;
        return position;
      } else {
        if (position < screenSize.height && position>0) {
          speed = speed + 0.4;

          position = position + speed;
          return position;
        } else {
          position = (screenSize.height - tileSize) / 2;
          speed = 0;
          return position;
        }
      }
    }
  }

  void onTapDown(TapDownDetails d){
    if(screenSize.contains(d.globalPosition))
      {
        //speed=-100;
        jump=true;
      }
    }

    void onTapUp(TapUpDetails d){
      if(screenSize.contains(d.globalPosition))
      {
        jump=false;

      }
    }

  double startingPointforPipe(){
    return screenSize.width;
  }

  double movingPipes(){
     if(xPipeMove==null){
       xPipeMove=screenSize.width;
       return xPipeMove;
     }else{
       if(xPipeMove+100<0){
         xPipeMove=null;
         randomPipe();
         return xPipeMove;}

       else{
          xPipeMove=xPipeMove-2;
          return xPipeMove;
            }
       }

     }





  @override
  void render(Canvas canvas) {
    Rect bg = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgp=Paint()..color=Colors.white;
      canvas.drawRect(bg, bgp);
      //print(Position());
    bird=Bird(this,bPosition());
    bird.render(canvas);


   pipe.render(canvas);


    pipe=Pipes(this,movingPipes());
    //print(lastMovement);
  // print(movingPipes());
    //print("$movingPipes() and  $xPipeMove");
  }


  @override
  void update(double d) {
    pipe.update(d);
  }

}

