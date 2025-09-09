
import 'package:flutter/material.dart';
import 'package:safarni/features/profile/presentation/views/account_secuirty_view.dart';
import 'package:safarni/features/profile/presentation/views/personal_information_view.dart';
import 'package:safarni/features/profile/presentation/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:const ProfileView(), 
      routes: {
        '/profile': (context) => const ProfileView(),
        '/personal_info': (context) =>  PersonalInformationView(),
        '/account_security': (context) =>const AccountSecurityView(),
      },
     
    );
  }
}
