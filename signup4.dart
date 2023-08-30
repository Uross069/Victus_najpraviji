import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'login.dart';

String name = "";
String username = "";
String email = "";
String password = "";
String password2 = "";

String poruka = 'Lozinka mora da sadrži najmanje 8 karaktera, barem jednu cifru i barem jedno slovo.';
Color boja = Colors.black;

class Signup4 extends StatefulWidget {
  const Signup4({super.key});

  @override
  State<Signup4> createState() =>  _Signup4State();

}
class _Signup4State extends State<Signup4> {


  Future<void> addStudents(String name1,String username1,String email1,String password1) async {
    //creates a new doc with unique doc ID
    return FirebaseFirestore.instance.collection('users')
        .add({
          'name': name1,
          'username' : username1,
          'mail': email1,
          'password' : password1,
        })
        .then((value) {})
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => debugPrint("Failed to add user: $error"));
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

  void check(){
      name = removeSpacesAtTheEnd(name);
      username = removeSpacesAtTheEnd(username);
      email = removeSpacesAtTheEnd(email);
      password = removeSpacesAtTheEnd(password);
      password2 = removeSpacesAtTheEnd(password2);
      bool odgovara = true;

      FirebaseFirestore.instance.collection('users').get().then((val){
        if(val.docs.isNotEmpty){
          for(var i = 0; i < val.docs.length;i++)
          {
            if(val.docs[i].data()["username"] == username)
            {
              odgovara = false;
              setState(() {
                poruka = "Korisničko ime je već zeuzeto. Molimo Vas da odaberete novo.";
                boja = 	Colors.red;               
              });
              break;
            }
            else if(val.docs[i].data()["mail"] == email)
            {
              odgovara = false;
              setState(() {
                poruka = "Ovaj e-mail je već korišten prilikom registacije. Molimo Vas da odaberete drugi.";
                boja = 	Colors.red;               
              });
              break;
            }else if(password != password2)
            {
              odgovara = false;
              setState(() {
                poruka = "Lozinke se ne poklapaju";
                boja = 	Colors.red;               
              });
              break;              
            }else if(password.length < 8)
            {
              odgovara = false;
              setState(() {
                poruka = "Lozinke mora biti dugačka najmanje 8 karaktera";
                boja = 	Colors.red;               
              }); 
              break;                           
            }else if(!password.contains(RegExp(r'[0-9]')))
            {
              odgovara = false;
              setState(() {
                poruka = "Lozinka mora da sadrži najmanje jednu cifru";
                boja = 	Colors.red;               
              });  
              break;                           
            }else if(!password.contains(RegExp(r'[a-z]')))
            {
              odgovara = false;
              setState(() {
                poruka = "Lozinka mora da sadrži najmanje jedno slovo";
                boja = 	Colors.red;               
              }); 
              break;              
            }else if(name.isEmpty || username.isEmpty)
            {
              odgovara = false;
              setState(() {
                poruka = "Ni jedno polje ne smije ostati prazno kako bi ste se prijavili";
                boja = 	Colors.red;               
              });  
              break;                           
            }

          }
          if(odgovara)
          {
            addStudents(name,username,email,password);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
          }
        }
        else{
          // ignore: avoid_print
          print("Not Found");
        }
        });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFc7dde8),
        body: Stack(
          children: [
            const Positioned(
              bottom: 0,
              right: 0,
              child : Curve1()),
              const Logo(),
              // ignore: prefer_const_constructors
              Title(),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.34 : MediaQuery.of(context).size.height * 0.618,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Ime i prezime',  
                  ),onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                )
              ),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom :  isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.26 : MediaQuery.of(context).size.height * 0.528,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Korisničko ime',  
                  ),onChanged: (value) {
                    setState(() {
                      username = value;                     
                    });
                  },
                )
              ),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.18 : MediaQuery.of(context).size.height * 0.438,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'E-mail',  
                  ),onChanged: (value) {
                    setState(() {
                      email = value;                     
                    });
                  },
                )
              ),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.10 : MediaQuery.of(context).size.height * 0.348,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Lozinka',  
                  ), onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  }, 
                )
              ),
              Positioned( 
                height:  MediaQuery.of(context).size.height * 0.06056789 ,
                width: MediaQuery.of(context).size.width * 0.743 ,
                bottom : isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.02 : MediaQuery.of(context).size.height * 0.258,
                left : MediaQuery.of(context).size.width * 0.09649,
                child : TextField (  
                  decoration: const InputDecoration(  
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold , color: Colors.black),
                    labelText: 'Potvrdite lozinku',  
                  ),onChanged: (value) {
                    setState(() {
                      password2 = value;
                    });
                  }, 
                )
              ),
              Positioned(
              height: MediaQuery.of(context).size.height * 0.1382,
              width: MediaQuery.of(context).size.width * 0.745,
              top: MediaQuery.of(context).size.height * 0.7682,
              left : MediaQuery.of(context).size.width * 0.0985,
              child: Text(
                poruka,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,color: boja),
              )
            ),
              Positioned( 
                height: MediaQuery.of(context).size.height * 0.058 ,
                width: MediaQuery.of(context).size.width * 0.4,
                top : MediaQuery.of(context).size.height * 0.85811,
                left : MediaQuery.of(context).size.width * 0.1,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF0a4c68),
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFF0a4c68),
                  ),
                  ),
                  child: const Text("Registruj se" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),
                  onPressed: () {
                    check();
                  },
                )
              ),
              const LogInm(),
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
      ..color = Colors.white
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
                  image: AssetImage('images/logo.png'),
                  )
                ) 
              );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Positioned(
              height: MediaQuery.of(context).size.height * 0.1382,
              width: MediaQuery.of(context).size.width * 0.545,
              bottom:  isKeyboardVisible ?  MediaQuery.of(context).size.height * 0.36 : MediaQuery.of(context).size.height * 0.6236,
              left : MediaQuery.of(context).size.width * 0.025,
              child: const Text(
                'Registracija',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
              )
            );
      }
  );
  }
}

class LogInm extends StatelessWidget {
  const LogInm({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              top: MediaQuery.of(context).size.height * 0.94,
              left : MediaQuery.of(context).size.width * 0.105,
              child: Text.rich(
                TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Imate nalog? ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Prijavite se ', 
                  recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login(),)),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0a4c68), decoration: TextDecoration.underline)),
                ],
                )
              )
            );
  }
}