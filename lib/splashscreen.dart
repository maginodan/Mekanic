import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      // Set the background color
      body: GestureDetector(
        onTap: () {
          // Navigate to the login page when tapped
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add a space above the Lottie animation for centering
              const SizedBox(height: 10),

              // Load a Lottie file from your assets
              Lottie.asset('assets/images/car repair.json'),

              // Load a Lottie file from a remote URL
              // Lottie.network(
              // 'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json')
              // 'https://assets5.lottiefiles.com/packages/1f20_jmejybvu.json'),

              // Load an animation and its images from a ZIP file
              // Lottie.asset('assets/lottiefiles/angel.zip'),
            ],
          ),
        ),
      ),
    );
  }
}
