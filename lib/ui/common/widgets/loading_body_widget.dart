import 'package:flutter/material.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
