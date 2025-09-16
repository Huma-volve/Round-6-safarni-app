import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/profile/domain/usecases/delete_account.dart';
import 'package:safarni/features/profile/presentation/cubits/delete_account_cubit.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_listTile.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_switch_button.dart';

class AccountSecurityView extends StatefulWidget {
  const AccountSecurityView({super.key});

  @override
  State<AccountSecurityView> createState() => _AccountSecurityViewState();
}

class _AccountSecurityViewState extends State<AccountSecurityView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(sl<DeleteAccountUseCase>()),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) {
          print('📌 State changed: $state');

          if (state is DeleteAccountLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          }

          if (state is DeleteAccountSuccess) {
            Navigator.of(context, rootNavigator: true).pop(); // close loader
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account deleted successfully')),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesNames.login,
              (route) => false,
            );
          }

          if (state is DeleteAccountFailure) {
            Navigator.of(context, rootNavigator: true).pop(); // close loader
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to delete account')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Account & Security'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const CustomProfileListTile(
                  title: 'Biometric ID',
                  trailing: CustomSwitchButton(),
                  height: 72,
                ),
                const CustomProfileListTile(
                  title: 'Face ID',
                  trailing: CustomSwitchButton(),
                ),
                const CustomProfileListTile(
                  title: 'Device Management',
                  subtitle:
                      'Manage your devices on the various devices you own',
                  trailing: Icon(Icons.arrow_forward_ios),
                  height: 72,
                ),
                const CustomProfileListTile(
                  title: 'Deactivate Account',
                  subtitle:
                      'Temporarily deactivate your account. Easily reactivate when you are ready',
                  trailing: Icon(Icons.arrow_forward_ios),
                  height: 72,
                ),
                InkWell(
                  onTap: () {
                    CustomShowDialog(context);
                  },
                  child: const CustomProfileListTile(
                    title: 'Delete Account',style: TextStyle(color: Colors.red),
                    subtitle:
                        'Permanently delete your account and all of your data. Proceed with caution',
                    trailing: Icon(Icons.arrow_forward_ios),
                    height: 72,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

void CustomShowDialog(BuildContext parentContext) {
  showDialog(
    context: parentContext, // Pass the parent context
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        content: Text('Are you sure you want to delete your account?',style: AppStyles.searchTitleStyle,),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              parentContext
                  .read<DeleteAccountCubit>()
                  .deleteAccount(); // Use parentContext for the cubit
              Navigator.pop(dialogContext); // Close the dialog
            },
            child: const Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
