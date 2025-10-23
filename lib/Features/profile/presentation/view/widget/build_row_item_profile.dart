import 'package:flutter/material.dart';

class BuildRowItemProfile extends StatelessWidget {
  const BuildRowItemProfile({super.key, required this.title, required this.icon,});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            const Spacer(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
