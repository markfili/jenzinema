import 'package:flutter/material.dart';

import '../../../common/helpers/borders.dart';
import '../../../common/helpers/insets.dart';
import '../../../common/helpers/j_colors.dart';
import '../../../common/helpers/text_styles.dart';

class MovieGenre extends StatelessWidget {
  final String genre;

  const MovieGenre(this.genre, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: JColors.genre,
        borderRadius: BorderRadius.circular(Borders.small),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.small,
          horizontal: Insets.medium,
        ),
        child: Text(
          genre,
          style: TextStyles.genre,
        ),
      ),
    );
  }
}
