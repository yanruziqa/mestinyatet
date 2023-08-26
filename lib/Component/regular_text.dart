import 'package:flutter/material.dart';

class RegularText extends StatelessWidget {
  const RegularText(this.teks, {super.key});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          teks,
          style: const TextStyle(
            fontFamily: "AnonymousPro-Regular",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
