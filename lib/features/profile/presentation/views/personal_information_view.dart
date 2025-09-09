import 'package:flutter/material.dart';

class PersonalInformationView extends StatelessWidget {
   PersonalInformationView({super.key});
   final _formKey = GlobalKey<FormState>();
   final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();
   final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration:const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: emailController,
                decoration:const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: phoneController,
                decoration:const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: countryController,
                decoration:const InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
              ),
        ],
        ),
        ),    
          ),
    );
  }
}