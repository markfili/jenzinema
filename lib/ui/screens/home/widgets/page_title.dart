import 'package:flutter/material.dart';

import '../../../common/helpers/insets.dart';
import '../../../common/helpers/text_styles.dart';

class PageTitle extends StatelessWidget {
  final String pageTitle;

  const PageTitle(this.pageTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(Insets.large + Insets.small),
      child: Text(
        pageTitle,
        style: TextStyles.pageTitle,
        textAlign: TextAlign.start,
      ),
    );
  }
}
