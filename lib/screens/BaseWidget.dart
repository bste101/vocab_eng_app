import 'dart:ui';

abstract class BaseWidget{
  void resiza(Size size);

  void render(Canvas canvas);

  void update();
}