import 'package:flutter/material.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_info_text_field.dart';


class PersonalInformationView extends StatelessWidget {
  PersonalInformationView({required this.user, super.key});
  final _formKey = GlobalKey<FormState>();
  final Map<String,dynamic>? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information'),backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProfileInfoTextField(
                initialValue: user?['name'] ?? '',
                label: 'Full Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 32),

              CustomProfileInfoTextField(
                initialValue: user?['email'] ?? '',
                label: 'Email',
                icon: Icons.email,
              ),

              const SizedBox(height: 32),

              CustomProfileInfoTextField(
                initialValue: user?['phone'] ?? '',
                label: 'Phone Number',
                icon: Icons.phone,
              ),

              const SizedBox(height: 32),
              CustomProfileInfoTextField(
                initialValue: user?['country'] ?? '',
                label: 'Country',
                icon: Icons.flag,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
