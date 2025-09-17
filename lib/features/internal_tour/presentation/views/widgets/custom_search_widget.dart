import 'dart:async';

import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchTextField({super.key, required this.onSearch});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _hasFocus ? AppColors.viewAllColor : AppColors.grey200,
          width: _hasFocus ? 0.5 : 1,
        ),
        boxShadow: _hasFocus
            ? [const BoxShadow(color: AppColors.grey400, spreadRadius: 4)]
            : [],
      ),
      child: TextFormField(
        focusNode: _focusNode,
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            widget.onSearch(value);
          });
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.grey400),
          hintText: "Search...",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}
