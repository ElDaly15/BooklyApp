import 'package:flutter/material.dart';

class ProgressIndecator extends StatelessWidget {
  const ProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
