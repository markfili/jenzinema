import 'package:flutter/material.dart';

import '../../screens/home/widgets/page_title.dart';

class ScreenPage extends StatelessWidget {
  final String title;
  final Widget body;

  const ScreenPage({
    required this.title,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTitle(title),
        Expanded(child: body),
      ],
    );
  }
}
