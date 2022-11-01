import 'package:flutter/cupertino.dart';

import '../../../common/helpers/insets.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const NavBarItem({required this.icon, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: Insets.medium + Insets.xsmall),
              Text(title),
            ],
          ),
        ],
      ),
    );
  }
}
