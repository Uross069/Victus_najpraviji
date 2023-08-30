import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'package:practice/signup4.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

String name = "";
String password = "";

bool isChecked = false;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool isVisible = false;
   Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      runApp(MaterialApp(home: email == null ? const Login() : const Home()));
    }

  String removeSpacesAtTheEnd(String str)
  {
    if(str.isEmpty) {
      return "";
    }
    while(str[str.length-1] == " ") {
      str= str.substring(0, str.length - 1);
    }
    return str;
  }

  void check2(){
      name = removeSpacesAtTheEnd(name);
      password = removeSpacesAtTheEnd(password);

      FirebaseFirestore.instance.collection('users').get().then((val){
        if(val.docs.isNotEmpty){
          for(var i = 0; i < val.docs.length;i++)
          {
            if(val.docs[i].data()["password"] == password)
            {
              if(val.docs[i].data()["username"] == name || val.docs[i].data()["mail"] == name)
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));                                
                break;
              }else{
                setState(() {
                  isVisible = true;
                });
              }
            }
          }
          setState(() {
            isVisible = true;
          });
        }
        else{
          // ignore: avoid_print
          print("Not Found");
        }
        });
  }

  @override
  Widget build(BuildContext context) {
    main();
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned(
              bottom: 0,
              right: 0,
              child : Curve1()),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.1382,
                width: MediaQuery.of(context).size.width * 0.545,
                bottom: isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.36 : MediaQuery.of(context).size.height * 0.6236 ,
                left : MediaQuery.of(context).size.width * 0.025,
                child: const Text(
                  'Prijava',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                )
              ),
              const Logo(),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.34 : MediaQuery.of(context).size.height * 0.618 ,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Korisničko ime ili E-mail',  
                  ),onChanged: (value) {
                    name = value;
                  },
                )
              ),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.26 : MediaQuery.of(context).size.height * 0.528,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Lozinka',  
                  ),onChanged: (value) {
                    setState(() {
                      password = value;                     
                    });
                  },
                )
              ),Positioned( 
                height: MediaQuery.of(context).size.height * 0.058 ,
                width: MediaQuery.of(context).size.width * 0.4,
                top : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.40811 : MediaQuery.of(context).size.height * 0.51811,
                left : MediaQuery.of(context).size.width * 0.1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0a4c68),
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF0a4c68),
                  ),
                  ),
                  child: const Text("Prijavi se" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                  onPressed: () async {
                    check2();
                    if(isChecked)
                    {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', 'useremail@gmail.com');
                    }
                  },
                )
              ),
              Positioned(
                top: isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.6,
                left : MediaQuery.of(context).size.width * 0.105,
                child: Text.rich(
                  TextSpan(
                  children: <TextSpan>[
                    const TextSpan(text: 'Nemate nalog? ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Registrujte se ', 
                    recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup4(),)),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0a4c68), decoration: TextDecoration.underline)),
                  ],
                  )
                )
              ),
              Positioned( 
                height: MediaQuery.of(context).size.height * 0.1 ,
                width: MediaQuery.of(context).size.width * 0.1,
                top : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.39 : MediaQuery.of(context).size.height * 0.50,
                left : MediaQuery.of(context).size.width * 0.64,
                child: Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                )
              ),
              Positioned(
                height: MediaQuery.of(context).size.height * 0.058 ,
                width: MediaQuery.of(context).size.width * 0.23,
                top :isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.42911 : MediaQuery.of(context).size.height * 0.53911,
                left : MediaQuery.of(context).size.width * 0.72,
              child: const Text(
                "Zapamti me",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
              )
            ),
            Positioned(
                height: MediaQuery.of(context).size.height * 0.1382,
                width: MediaQuery.of(context).size.width * 0.745,
                top: MediaQuery.of(context).size.height * 0.6582,
                left : MediaQuery.of(context).size.width * 0.0985,
                child: Visibility(
                  visible: isVisible,
                  child : const Text(
                  "Netačnan e-mail/korisničko ime ili lozinka. Provjerite da li ste unijeli dobre podatke.",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                ))
              )
          ]
        )
      )
    );
      }
  );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFFc7dde8)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1, size.height * 0.9);
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
              height: MediaQuery.of(context).size.height * 2.3,
              width: MediaQuery.of(context).size.width* 50 / 41.14,
              child: CustomPaint(
                size: const Size(500, 1700),
                painter: CurvedPainter() 
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
                bottom : MediaQuery.of(context).size.height * 0.807,
                left : MediaQuery.of(context).size.width * 0.02649,
                child : ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child : const Image(
                  image: AssetImage('images/logo2.png'),
                  )
                ) 
              );
  }
}