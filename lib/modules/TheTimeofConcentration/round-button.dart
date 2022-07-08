import 'package:flutter/material.dart';
import 'package:flutters/shared/style/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(backgroundColor: defaultcolor,
        radius: 30,
        child: Icon(
          icon,color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}
