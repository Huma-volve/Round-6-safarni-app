import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class SearchTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchTextField({super.key, this.onChanged});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _hasFocus ? AppColors.primaryColor : AppColors.lightGrey,
          width: _hasFocus ? 0.5 : 1,
        ),
        boxShadow: _hasFocus
            ? [
                const BoxShadow(
                  color: AppColors.transparentBlue,
                  spreadRadius: 4,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              "assets/icons/search-normal.png",
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 20,
          ),

          hintText: "Search...",
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 16 / 12,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
