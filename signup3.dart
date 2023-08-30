import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:practice/signup4.dart';

class Signup3 extends StatefulWidget {
  const Signup3({super.key});

  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
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
              child : Curved1()),
            Positioned(
              bottom: 0,
              right: 0,
              child : Curved2()),
            Positioned(
              top: 0,
              left: 0,
              child : Curveu1()),
            Positioned(
              top: 0,
              left: 0,
              child : Curveu2()),
            Menu(),
            Continue(),
            Progress(),
            Description(),
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

class Curved1 extends StatelessWidget {
  const Curved1({super.key});

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

class Curved2 extends StatelessWidget {
  const Curved2({super.key});

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

class Curveu1 extends StatelessWidget {
  const Curveu1({super.key});

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(180 / 360),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width* 50 / 41.14,
        child: CustomPaint(
          size: const Size(500, 200),
          painter: CurvedPainter() 
        )
      )
    );
  }
}

class Curveu2 extends StatelessWidget {
  const Curveu2({super.key});

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(180 / 360),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.38,
        width: MediaQuery.of(context).size.width* 50 / 41.14,
        child: CustomPaint(
          size: const Size(500, 200),
          painter: CurvedPainter2() 
        )
      )
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: MediaQuery.of(context).size.height* 0.13,
              right: MediaQuery.of(context).size.width * 0.02,
              child : SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width * 0.96,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child : const Image(
                  image: AssetImage('images/uvod3.jpg'),
                  )
                ) 
              )
            );
  }
}

class Continue extends StatelessWidget {
  const Continue({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned( 
                height: MediaQuery.of(context).size.height * 0.058 ,
                width: MediaQuery.of(context).size.width * 0.7,
                bottom : MediaQuery.of(context).size.height * 0.15811,
                right : MediaQuery.of(context).size.width * 0.15,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0a4c68),
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF0a4c68),
                  ),
                  ),
                  child: const Text("Dalje" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup4(),));
                  },
                )
              );
  }
}

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: MediaQuery.of(context).size.height* 0.55,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              child : DotsIndicator(
                dotsCount: 4,
                position: 2,
                decorator: const DotsDecorator(
                  color: Color(0xFF000000), // Inactive color
                  activeColor: Color.fromARGB(255, 26, 186, 255),
                ),
              )
            );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              height: MediaQuery.of(context).size.height * 0.1382,
              width: MediaQuery.of(context).size.width * 0.845,
              bottom: MediaQuery.of(context).size.height * 0.2782,
              left : MediaQuery.of(context).size.width * 0.0975,
              child: const Text(
                'Sa lakoćom možete pregledati radno vrijeme restorana, vidjeti vizualni pregled prostora, pregledati jela u 3D-u ili provjeriti ocjene i komentare drugih korisnika i još mnogo toga. Registrujte se i uživajte u potpunom iskustvu obližnjih restorana.',
                textAlign: TextAlign.center,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
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
                top : MediaQuery.of(context).size.height * 0.043,
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