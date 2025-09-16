import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/features/profile/domain/repositories/user_repository.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_circular_image.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_listTile.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userJson = await sl<CacheHelper>().getData('user'); 
    setState(() {
      userData = jsonDecode(userJson); 
    });
  }
  Future<void> _logout() async {
    try {
      await sl<UserRepository>().logout();
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesNames.login,
          (route) => false,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Logout failed")));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.white,
      ),
      body: userData == null
          ? const Center(
              child: CircularProgressIndicator(),
            ) 
          : profileBody(context),
    );
  }

  Widget profileBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
      child: Column(
        children: [
           SizedBox(height: AppSize.padVertical8),
          const CustomCircularImage(
        ), 
           SizedBox(height: AppSize.padVertical8),
          Text(
            userData!['name'],
            style: AppStyles.profileUserNameStyle,
          ), // استخدام الاسم
           SizedBox(height: AppSize.padVertical8),
          Text(
            userData!['email'],
            style: AppStyles.profileUserEmailStyle,
          ), 
           SizedBox(height: AppSize.top24),
          CustomProfileListTile(
            leading: SvgPicture.asset(AppIcons.personalIcon),
            title: AppStrings.personalInfo,
            style: AppStyles.profileViewItemStyle,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.personalInformation,
                arguments: userData,
              );
            },
          ),
          CustomProfileListTile(
            leading: SvgPicture.asset(AppIcons.lockClosedIcon),
            title: AppStrings.accountSecurity,
            style: AppStyles.profileViewItemStyle,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.accountSecurity);
            },
          ),
          CustomProfileListTile(
            leading: SvgPicture.asset(AppIcons.windowIcon),
            title: AppStrings.myBooking,
            style: AppStyles.profileViewItemStyle,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.myBookings);
            },
          ),
          CustomProfileListTile(
            leading: SvgPicture.asset(AppIcons.langIcon, height: 24, width: 24),
            title: AppStrings.appLanguage,
            style: AppStyles.profileViewItemStyle,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
          InkWell(
            onTap:(){
               CustomShowDialog(context);
            },
            child: CustomProfileListTile(
              leading: SvgPicture.asset(AppIcons.arrowLeftOnRectangleIcon),
              title: AppStrings.logOut,
              style: AppStyles.logoutStyle,
            ),
          ),
        ],
      ),
    );
  }

  void CustomShowDialog(BuildContext context) {
    showDialog(
                  context: context,
                  builder: (context) {
     return AlertDialog(
      
       content: Text('Do You Want To Register The Exit Already ?',style: AppStyles.searchTitleStyle,),
       actions: [
         TextButton(
           onPressed: () => Navigator.pop(context),
           child: const Text("No"),
         ),
         TextButton(
           onPressed: () {
            setState(() {
             _logout();
            });
           },
           child: const Text("Yes",style: TextStyle(color: Colors.red),),
           
         ),
       ],
     );
                } ,
    );
  }
}
