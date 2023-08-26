import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 42, 76),
      body: Center(
        child: Text(
          "mestisukses",
          style: TextStyle(
            color: Colors.white24,
            fontSize: 28,
            fontFamily: 'Poppins-Bold',
          ),
        ),
      ),
    );
  }
}
