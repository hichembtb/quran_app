import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    const widget = CircularProgressIndicator();

    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}
