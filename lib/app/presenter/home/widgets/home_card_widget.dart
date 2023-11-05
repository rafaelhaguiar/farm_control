import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback function;
  const HomeCardWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: function,
        child: Container(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.grey,
            Colors.white,
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 45),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
