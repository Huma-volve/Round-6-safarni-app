import 'package:flutter/material.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_listTile.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_switch_button.dart';

class AccountSecurityView extends StatelessWidget {
  const AccountSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Account & Security'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          CustomProfileListTile(
            title: "Biometric ID",
            trailing: CustomSwitchButton(),
            height: 72,
          ),
          CustomProfileListTile(title: 'Face ID', trailing: CustomSwitchButton()),
          CustomProfileListTile(
            title: 'Device Management',
            subtitle: 'manage your devices on the various devices you own',
            trailing: Icon(Icons.arrow_forward_ios),
                        height: 72,
          ),
          CustomProfileListTile(
            title: 'Deactivate Account',
            subtitle:
                'Temporarily deactivate your account.Easily reactivate when you are ready',
            trailing: Icon(Icons.arrow_forward_ios),
            height: 72,
          ),
          CustomProfileListTile(
            title: 'Delete Account',
            subtitle:
                'permanently delete your account and all of your data from Tripmate.Proceed with caution',
            trailing: Icon(Icons.arrow_forward_ios),
            height: 72,
          ),
        ],
      ),
    );
  }
}
