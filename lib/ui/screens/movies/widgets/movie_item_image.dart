import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/config.dart';

class MovieItemImage extends StatelessWidget {
  final String? path;

  const MovieItemImage(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return const SizedBox.shrink();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: CachedNetworkImage(
        imageUrl: "${Config.movieBackdropUrl}$path",
        fit: BoxFit.cover,
        height: 100,
        width: 100,
        errorWidget: (_, __, ___) => const SizedBox.shrink(),
      ),
    );
  }
}
