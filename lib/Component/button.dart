import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.teks,
    required this.icon,
    required this.action,
    required this.direction,
    super.key,
  });

  final String teks;
  final IconData icon;
  final void Function() action;
  final TextDirection direction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      onPressed: action,
      child: Row(
        textDirection: direction,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
          ),
          Text(teks),
        ],
      ),
    );
  }
}
