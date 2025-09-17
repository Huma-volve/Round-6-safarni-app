import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomPickImage extends StatefulWidget {
  const CustomPickImage({super.key});

  @override
  State<CustomPickImage> createState() => _CustomPickImageState();
}

class _CustomPickImageState extends State<CustomPickImage> {
  File? _image; // store selected image
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Image from Gallery")),
      body: Center(
        child: GestureDetector(
          onTap: _pickImage, // open gallery when tap
          child: _image == null
              ? Image.asset(
                  "assets/placeholder.png",
                  height: 150,
                ) // default image
              : Image.file(_image!, height: 150),
        ),
      ),
    );
  }
}
