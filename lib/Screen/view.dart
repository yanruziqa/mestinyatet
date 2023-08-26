import 'package:flutter/material.dart';
import 'package:mestinyatet/Component/button.dart';
import 'package:mestinyatet/Component/heading.dart';
import 'package:mestinyatet/Component/regular_text.dart';

class ViewJournal extends StatelessWidget {
  const ViewJournal({
    super.key,
    required this.curr,
  });

  final Map curr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Heading(
              "Syukur",
            ),
            RegularText(
              curr['gratitude'],
            ),
            const Heading(
              "Abaikan",
            ),
            RegularText(
              curr['fuck_it'],
            ),
            const Heading(
              "Emosi",
            ),
            RegularText(
              curr['emotion'],
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  teks: "Tutup",
                  icon: Icons.close,
                  action: () {
                    Navigator.pop(context);
                  },
                  direction: TextDirection.ltr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
