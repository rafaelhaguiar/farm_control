import 'package:flutter/material.dart';

class FarmHeaderWidget extends StatelessWidget {
  const FarmHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/farm.png',
            width: MediaQuery.sizeOf(context).width * 0.5),
        const Column(
          children: [
            Text(
              'Farm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            Text(
              'Control',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ],
        )
      ],
    );
  }
}
