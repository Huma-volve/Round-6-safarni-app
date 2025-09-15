import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_circular_image.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_listTile.dart';
import 'package:safarni/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:safarni/features/profile/data/repositories/user_repositry_impl.dart';
import 'package:safarni/features/profile/domain/entities/profile_entity.dart';
import 'package:safarni/features/profile/domain/usecases/get_user_profile.dart';
import 'package:safarni/features/profile/presentation/cubits/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(
        GetUserProfile(
          UserRepositoryImpl(UserRemoteDataSourceImpl(dio: Dio())),
        ),
      )..loadProfile(),
      child: Scaffold(
        appBar: AppBar(title: const Text(''), backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              return profileBody(state.user, context);
            } else if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget profileBody(ProfileEntity user, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          SizedBox(height: AppSize.padVertical8),
          CustomCircularImage(imageUrl: user.imageUrl),
          SizedBox(height: AppSize.padVertical8),
          Text(user.name, style: AppStyles.profileUserNameStyle),
          SizedBox(height: AppSize.padVertical8),
          Text(user.email, style: AppStyles.profileUserEmailStyle),
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
                arguments: user,
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
          CustomProfileListTile(
            leading: SvgPicture.asset(AppIcons.arrowLeftOnRectangleIcon),
            title: AppStrings.logOut,
            style: AppStyles.logoutStyle,
          ),
        ],
      ),
    );
  }
}
