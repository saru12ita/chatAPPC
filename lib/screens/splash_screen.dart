import 'package:chatting_app/main.dart';
import 'package:chatting_app/screens/auth/login_screen.dart';
import 'package:chatting_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if (FirebaseAuth.instance.currentUser != null) {
        print(
            '\nUser: ${FirebaseAuth.instance.currentUser}'); // Use print instead of log

        //navigate to home screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        //navigate to Login screen
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to DexKor'),
      ),
      body: Stack(
        children: [
          Positioned(
              top: mq.height * 0.15,
              right: mq.width * 0.25,
              //right: mq.width * 0.25,
              width: mq.width * 0.5,
              child: Image.asset('assets/images/icon.png')),
          Positioned(
              bottom: mq.height * 0.15,
              //left: mq.width * 0.05,
              width: mq.width,
              //height: mq.height * .06,
              child: const Text(
                "DexKor ChatAPP 🤩",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  letterSpacing: .5,
                ),
              )),
        ],
      ),
    );
  }
}
