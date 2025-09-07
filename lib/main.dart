import 'package:flutter/material.dart';
import 'package:safarni/core/helper/on_generate_method.dart';

void main() {
  runApp(const SafarniApp());
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(onGenerateRoute: onGenerateMethod);
  }
}
