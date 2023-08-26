import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading(this.teks, {super.key});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          teks,
          style: const TextStyle(
            fontFamily: "Poppins-Bold",
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
