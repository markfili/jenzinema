import 'package:flutter/material.dart';

class JBackButton extends StatelessWidget {
  const JBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.arrow_right_alt,
        ),
      ),
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }
}
