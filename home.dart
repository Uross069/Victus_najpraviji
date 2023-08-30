import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: const [
            Positioned(
              bottom: 0,
              right: 0,
              child : Curveu1()),
            Positioned(
              bottom: 0,
              right: 0,
              child : Curveu2()),
            Positioned(
              top: 0,
              right: 0,
              child : Kon()),
            Logo(),
            
          ]
        )
      )
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF8cabbd)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1, size.height * 0.59);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFFc7dde8)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 1);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1, size.height * 0.59);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Curveu1 extends StatelessWidget {
  const Curveu1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width* 50 / 41.14,
        child: CustomPaint(
          size: const Size(500, 200),
          painter: CurvedPainter() 
        )
      );
  }
}

class Curveu2 extends StatelessWidget {
  const Curveu2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.38,
        width: MediaQuery.of(context).size.width* 50 / 41.14,
        child: CustomPaint(
          size: const Size(500, 200),
          painter: CurvedPainter2() 
        )
      );
  }
}

class Kon extends StatelessWidget {
  const Kon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: const Color(0xFFc7dde8),
              )
            );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned( 
                height:  MediaQuery.of(context).size.height * 0.14056789 / 2,
                width: MediaQuery.of(context).size.width * 0.243 / 2,
                top : MediaQuery.of(context).size.height * 0.02,
                left : MediaQuery.of(context).size.width * 0.01649,
                child : ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child : const Image(
                  image: AssetImage('images/logo.png'),
                  )
                ) 
              );
  }
}