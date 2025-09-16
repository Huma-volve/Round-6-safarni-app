import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/internal_tour/presentation/cubit/tour_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

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
            ? [
                const BoxShadow(
                  color: AppColors.grey400,
                  spreadRadius: 4,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                ),
              ]
            : [],
      ),
      child: TextFormField(
        focusNode: _focusNode,
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();
          _debounce = Timer(const Duration(milliseconds: 500), () {
            context.read<TourCubit>().fetchTours(searchQuery: value);
          });
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              CupertinoIcons.search,
              color: AppColors.grey400,
              size: 22.sp,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 36,
            minHeight: 20,
          ),
          hintText: " search...",
          hintStyle: const TextStyle(
            color: AppColors.grey500,
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
