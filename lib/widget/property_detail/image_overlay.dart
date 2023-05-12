import 'dart:ui';

import 'package:flutter/material.dart';

class ImageOverlay extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const ImageOverlay({Key? key, required this.imagePath, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Center(
            child: Image.asset(imagePath),
          ),
        ),
      ],
    );
  }
}
