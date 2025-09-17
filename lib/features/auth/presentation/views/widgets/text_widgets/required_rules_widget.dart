import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rule_widget.dart';

class RequiredRulesWidget extends StatelessWidget {
  RequiredRulesWidget({
    super.key,
    this.hasMinLength = false,
    this.hasSpecialCharacters = false,
  });
  bool hasSpecialCharacters;
  bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredRuleWidget(
          ruleText: AppStrings.mustBeAtLeast8Characters,
          ruleCorrect: hasMinLength,
        ),
        VerticalSpace(height: 16),
        RequiredRuleWidget(
          ruleText: AppStrings.mustContainOne,
          ruleCorrect: hasSpecialCharacters,
        ),
      ],
    );
  }
}
