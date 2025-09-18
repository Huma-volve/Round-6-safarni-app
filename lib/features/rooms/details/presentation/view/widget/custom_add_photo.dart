import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomAddPhoto extends StatefulWidget {
  const CustomAddPhoto({required this.onImageSelected, super.key});
  final ValueChanged<String> onImageSelected;
  @override
  State<CustomAddPhoto> createState() => _CustomAddPhotoState();
}

class _CustomAddPhotoState extends State<CustomAddPhoto> {
  late File fileImage;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      fileImage = File(image.path);
      widget.onImageSelected(fileImage.path);
    }
  }

  void showPickOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPickOptions(context),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.iconsCamera, fit: BoxFit.fill),
          const SizedBox(width: 8),
          Text(
            'add Photo',
            style: AppStyles.textMedium15(
              context: context,
            ).copyWith(color: AppColors.thirdColor),
          ),
        ],
      ),
    );
  }
}
