import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchMap extends StatelessWidget {
  final Function(String) onSearch;
  final String text;
  const CustomSearchMap({
    super.key,
    required this.onSearch,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: text,
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
      ),
    );
  }
}
