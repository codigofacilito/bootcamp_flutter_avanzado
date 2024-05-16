import 'package:flutter/material.dart';

class ImplicitAnimationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImplicitAnimationsPageState();
}

class ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {
  static const _alingments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
    Alignment.center
  ];
  int _index = 0;

  AlignmentGeometry get _aliment => _alingments[_index % _alingments.length];

  double width = 50;

  bool animated = false;

  double scale = 0.0;

  Offset offset = Offset.zero;
  bool selected = false;
  double opacityLevel = 1.0;
  double turns = 0.0;
  bool _trigger = true;
  double _size = 50.0;
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _index++;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: animatedCrossFade(),
    );
  }

  animatedAlign() {
    return AnimatedAlign(
      alignment: _aliment,
      curve: Curves.elasticOut,
      duration: const Duration(seconds: 1),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.greenAccent,
      ),
    );
  }

  animatedContainer() {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: animated ? 500 : 100,
          height: animated ? 300 : 50,
          color: animated ? Colors.red : Colors.greenAccent,
        ),
        onClick(() {
          setState(() {
            animated = !animated;
          });
        })
      ],
    );
  }

  animatedTextStyle() {
    return Center(
        child: Column(
      children: [
        AnimatedDefaultTextStyle(
            curve: Curves.bounceInOut,
            child: Text("CodigoFacilito"),
            style: animated
                ? TextStyle(color: Colors.greenAccent, fontSize: 30)
                : TextStyle(color: Colors.black, fontSize: 15),
            duration: Duration(milliseconds: 500)),
        onClick(() {
          setState(() {
            animated = !animated;
          });
        })
      ],
    ));
  }

  //1 es el tamaño total y 0 desaparece
  //Si colocamos un valor mayor a 1 el tamaño de widget se multiplicara
  animatedScale() {
    return Center(
        child: GestureDetector(
            onDoubleTap: () {
              setState(() {
                scale = 1;
              });
            },
            child: Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Expanded(
                      child: AnimatedScale(
                    curve: Curves.fastLinearToSlowEaseIn,
                    onEnd: () {
                      setState(() {
                        scale = 0;
                      });
                    },
                    scale: scale,
                    duration: Duration(milliseconds: 600),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.pinkAccent,
                      size: 300,
                    ),
                  )),
                ],
              ),
            )));
  }

  animatedRotation() {
    return Column(
      children: [
        AnimatedRotation(
          duration: const Duration(milliseconds: 500),
          turns: turns,
          child: const Icon(Icons.refresh),
        ),
        onClick(() {
          setState(() {
            //Vamos girando poco a poco la formula usada en el widget es turns * 2 * pi
            turns += 1.0 / 8.0;
          });
        })
      ],
    );
  }

  //En la pantalla tendremos un plano donde el valor de x en 0 y Y en 0 sera la esquina
  //superior izquierda ahi Offset(0, 0) si queremos que se mueva nuestro widget de izquierda a derecha
  //modificamos offset X Offset(1, 0) y si queremos de arriba a abajo offset Y Offset(0, 1)
  animatedSlide() {
    return Column(
      children: [
        AnimatedSlide(
          offset: offset,
          duration: Duration(milliseconds: 500),
          child: const Icon(Icons.moped),
        ),
        onClick(() {
          setState(() {
            offset = Offset(0, 1);
          });
        })
      ],
    );
  }

  animatedOpacity() {
  return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          child: const FlutterLogo(size: 100,),
        ),
        onClick(() {
          setState(() {
            opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
          });
        })
      ],
    ));
  }

  animatedPadding() {
    return Column(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          color: Colors.red,
          child: AnimatedPadding(
            child: Container(
              color: Colors.black,
            ),
            padding: _trigger
                ? EdgeInsets.all(5.0)
                : EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
          ),
        ),
        onClick(() {
          setState(() {
            _trigger = !_trigger;
          });
        })
      ],
    );
  }

  animatedPosition() {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const ColoredBox(
                color: Colors.blue,
                child: Center(child: Text('Animar')),
              ),
            ),
          ),
        ],
      ),
    );
  }

  animatedTheme() {
    return Column(
      children: [
        AnimatedTheme(
          data: _trigger ? ThemeData.light() : ThemeData.dark(),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                width: 100,
                height: 100,
                color: Theme.of(context).primaryColor,
              );
            },
          ),
        ),
        onClick(() {
          setState(() {
            _trigger = !_trigger;
          });
        })
      ],
    );
  }

  animatedCrossFade() {
    return Center(child:Column(
      children: [
        AnimatedCrossFade(
          firstChild:
              FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild:
              FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState:
              _trigger ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        ),
        onClick(() {
          setState(() {
            _trigger = !_trigger;
          });
        })
      ],
    ));
  }

  animatedSize() {
    return Column(
      children: [
        ColoredBox(
          color: Colors.amberAccent,
          child: AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(seconds: 1),
            child: FlutterLogo(size: _size),
          ),
        ),
        onClick(() {
          setState(() {
            _size = _large ? 250.0 : 100.0;
            _large = !_large;
          });
        })
      ],
    );
  }

  onClick(action) {
    return ElevatedButton(onPressed: () => action(), child: Text("Animar"));
  }
}
