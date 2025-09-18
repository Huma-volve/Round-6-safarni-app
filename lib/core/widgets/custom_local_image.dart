import 'dart:io';

import 'package:flutter/material.dart';

class CustomLocalImage extends StatelessWidget {
  const CustomLocalImage({required this.image, super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    final file = File(image);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,

      child: file.existsSync()
          ? AspectRatio(
              aspectRatio: 2.7 / 1.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(File(image), fit: BoxFit.cover),
              ),
            )
          : const Icon(Icons.error),
    );
  }
}

class CustomPersonLocalImage extends StatelessWidget {
  const CustomPersonLocalImage({required this.image, super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    final file = File(image);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,

      child: file.existsSync()
          ? AspectRatio(
              aspectRatio: 2.7 / 1.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(File(image), fit: BoxFit.cover),
              ),
            )
          : const Icon(Icons.person, size: 40, color: Colors.grey),
    );
  }
}
