import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchMap extends StatelessWidget {
  final Function(String) onSearch;

  const CustomSearchMap({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(CupertinoIcons.search, size: 24),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onFieldSubmitted: (value) {
        onSearch(value);
      },
    );
  }
}
