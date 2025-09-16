import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({super.key});

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8, 
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              }, 
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,
      ),
    );
  }
}
