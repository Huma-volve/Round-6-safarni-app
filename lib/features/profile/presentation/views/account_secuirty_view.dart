import 'package:flutter/material.dart';
import 'package:safarni/core/widgets/custom_profile_listTile.dart';

class AccountSecurityView extends StatelessWidget {
  const AccountSecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Security'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          CustomProfileListTile(
            title: "Biometric ID",
            trailing: Icon(Icons.toggle_off),
          ),
          CustomProfileListTile(title: 'Face ID', trailing: Icon(Icons.toggle_off)),
          CustomProfileListTile(
            title: 'Device Management',
            subtitle: 'manage your devices on the various devices you own',
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          CustomProfileListTile(
            title: 'Deactivate Account',
            subtitle:
                'Temporarily deactivate your account.Easily reactivate when you are ready',
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          CustomProfileListTile(
            title: 'Delete Account',
            subtitle:
                'permanently delete your account and all of your data from Tripmate.Proceed with caution',
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
