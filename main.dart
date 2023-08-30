import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice/signup1.dart';
import 'login.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

    void mainp2() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('prim', 'useremail@gmail.com');
    }

class MyApp extends StatelessWidget {

     Future<void> mainp() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var prim = prefs.getString('prim');
      runApp(MaterialApp(home: prim == null ? const MyApp() : const Login()));
    }
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    mainp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: const [
            Positioned.fill( 
              bottom : 90,
              right : 0,         
              child : Image(
              image: AssetImage('images/pizza.jpg'),
              alignment: Alignment.topCenter,
              fit:BoxFit.cover
              )
            ),Positioned(
              bottom: 0,
              right: 0,
              child : Curve1()),
            Positioned(
              bottom: 0,
              right : 0,
              child: Curve2()
            ),LogInd()
            ,Logo()   
            ,Start()
            ,Heading()
            ,Description()
          ]),
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

    path.moveTo(0, size.height * 0.83);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.1, size.height * 0.75);
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

    path.moveTo(0, size.height * 0.83);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.69,
        size.width * 0.51, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.89,
        size.width * 1.1, size.height * 0.76);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Curve1 extends StatelessWidget {
  const Curve1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              height: MediaQuery.of(context).size.height * 1.85,
              width: MediaQuery.of(context).size.width* 50 / 41.14,
              child: CustomPaint(
                size: const Size(500, 1300),
                painter: CurvedPainter() 
              )
            );
  }
}

class Curve2 extends StatelessWidget {
  const Curve2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: MediaQuery.of(context).size.height * 1.73,
            width: MediaQuery.of(context).size.width* 50 / 41.14,
            child : CustomPaint(
                size: const Size(500, 1220),
                painter: CurvedPainter2() 
              )
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: MediaQuery.of(context).size.height * 0.232,
              right : MediaQuery.of(context).size.width * 0.0624,
              child: const Text.rich(
                TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "Dobrodošli u Victus!", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0a4c68), fontSize: 20, fontFamily: 'BrunoAceSC')),
                ],
                )
              )
            );
  }
}

class LogInd extends StatelessWidget {
  const LogInd({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: MediaQuery.of(context).size.height * 0.04217,
              left : MediaQuery.of(context).size.width * 0.0729,
              child: Text.rich(
                TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Imate nalog? ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Prijavite se ',
                  // ignore: unnecessary_set_literal
                  recognizer: TapGestureRecognizer()..onTap = () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login(),)),
                    mainp2(),
                  } ,
                   style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0a4c68), decoration: TextDecoration.underline ,)),
                ],
                ),
              )
            );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned( 
                height:  MediaQuery.of(context).size.height * 0.14056789,
                width: MediaQuery.of(context).size.width * 0.243,
                bottom : MediaQuery.of(context).size.height * 0.263,
                left : MediaQuery.of(context).size.width * 0.03649,
                child : ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child : const Image(
                  image: AssetImage('images/logo.png'),
                  )
                ) 
              );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned( 
                bottom : MediaQuery.of(context).size.height * 0.01811,
                right : MediaQuery.of(context).size.width * 0.0486,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0a4c68),
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF0a4c68),
                  ),
                  ),
                  child: const Text("Započnite"),
                  onPressed: () {
                    mainp2();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup1(),));
                  },
                )
              );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              height: MediaQuery.of(context).size.height * 0.1082,
              width: MediaQuery.of(context).size.width * 0.875,
              bottom: MediaQuery.of(context).size.height * 0.1082,
              left : MediaQuery.of(context).size.width * 0.09722,
              child: const Text.rich(
                TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'Veliko nam je zadovoljstvo provesti Vas kroz aplikaciju i pokazati na koji način Vaše vrijeme provedeno u restoranu može da bude još bolje. Krenimo zajedno u otkrivanje novih okusa i iskustava.', style: TextStyle()),
                ],
                )
              )
            );
  }
}