import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/home/presentation/view/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';

class AppRouters{

  static Route onGenerateRoute(RouteSettings setting){
    switch (setting.name){
      case AppRoutes.homeScreen:{
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      }
      case AppRoutes.searchScreen:{
        return MaterialPageRoute(builder: (_)=>SearchScreen());
      }
      case AppRoutes.resultSearchScreen:{
        final title= setting.arguments.toString();
        return MaterialPageRoute(builder: (_)=>ResultOfSearchScreen(title:title ));
      }
      default: return MaterialPageRoute(builder: (_)=>Scaffold(backgroundColor: Colors.red,));

    }
  }
}