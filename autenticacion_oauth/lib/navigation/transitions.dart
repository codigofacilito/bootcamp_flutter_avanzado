import 'package:flutter/cupertino.dart';

class TransitionsExample {
  static slideRightRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    }, screen);
  }


  static slideLeftRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    }, screen);
  }


  static slideTopRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    }, screen);
  }

  static slideBottomRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    }, screen);
  }

  static sizeRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return Align(child:SizeTransition(
        axisAlignment: 1.0,
        axis: Axis.vertical,
        sizeFactor: Tween<double>(
            begin: 0.0,
            end: 1.0
        ).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        child: child,
      ));
    }, screen);
  }

  static fadeRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  FadeTransition(
        opacity: animation,
        child: child,
      );
    }, screen);
  }

  static scaleRotateRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
      );
    }, screen);
  }
  static scaleRoute(screen) {
    return pageRouteBuilder(( animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return  ScaleTransition(
        scale: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          ),
        ),
        child: child,
      );
    }, screen);
  }

  static rotationRoute(screen) {
    return pageRouteBuilder((animation, Widget child) {
      //retornamos la fooTransition que se agregara a transitionsBuilder
      return RotationTransition(
        turns: Tween<double>(
            begin: 1.0,
            end: 0.0
        ).animate(CurvedAnimation(parent: animation, curve: Curves.bounceInOut)),
        child: child,);
    }, screen);
  }

  static pageRouteBuilder(fooTransition, screen) =>
      PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500), //Duracion de la trsnsicion al mostrarse
          reverseTransitionDuration:const Duration(milliseconds: 500), //Duracion de la trsnsicion al desaparecer
          pageBuilder: (BuildContext context, Animation animation,Animation secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //Ejcutamos la funcion fooTransition y enviamos la animacion para agregarla a la footransition y enviamos la ventana
            return fooTransition(animation,child);
          });
}
