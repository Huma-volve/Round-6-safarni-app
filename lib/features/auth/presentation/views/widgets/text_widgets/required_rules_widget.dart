import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/features/auth/presentation/views/widgets/text_widgets/required_rule_widget.dart';

class RequiredRulesWidget extends StatelessWidget {
  const RequiredRulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredRuleWidget(ruleText: AppStrings.mustBeAtLeast8Characters),
        RequiredRuleWidget(ruleText: AppStrings.mustContainOne),
      ],
    );
  }
}
