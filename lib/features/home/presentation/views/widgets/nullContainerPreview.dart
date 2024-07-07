import 'package:flutter/material.dart';

class NullPreviewContainer extends StatelessWidget {
  const NullPreviewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
            child: Text(
          'Can\'t Preview',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
