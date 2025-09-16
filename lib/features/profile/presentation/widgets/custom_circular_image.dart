import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:safarni/core/constants/app_icons.dart';

class CustomCircularImage extends StatefulWidget {
const CustomCircularImage({super.key});

  

  @override
  State<CustomCircularImage> createState() => _CustomCircularImageState();
}

class _CustomCircularImageState extends State<CustomCircularImage> {
  File? _selectedImage; 
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage, // فتح المعرض عند الضغط على الصورة
      child: Stack(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 46,
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    :const AssetImage('assets/images/Avatar.png') as ImageProvider,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: SvgPicture.asset(
                AppIcons.cameraPlusIcon,
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
