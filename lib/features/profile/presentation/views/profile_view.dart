import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/profile/presentation/views/account_secuirty_view.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_profile_listTile.dart';
import 'package:safarni/features/profile/data/datasources/user_remote_data_source.dart';
import 'package:safarni/features/profile/data/repositories/user_repositry_impl.dart';
import 'package:safarni/features/profile/domain/entities/profile_entity.dart';
import 'package:safarni/features/profile/domain/usecases/get_user_profile.dart';
import 'package:safarni/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:safarni/features/profile/presentation/views/my_booking_view.dart';
import 'package:safarni/features/profile/presentation/views/personal_information_view.dart';



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
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(radius: 40, backgroundImage: NetworkImage(user.imageUrl)),
          const SizedBox(height: 10),
          Text(
            user.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(user.email, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          CustomProfileListTile(
            leading: const Icon(Icons.person_outline),
            title: 'Personal Info',
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
                Navigator.pushNamed(context, AppRoutes.personalInformation,
                arguments: user,
              );
            },
          ),
      
          CustomProfileListTile(
            leading: const Icon(Icons.lock_outline),
            title: 'Account & Security',
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
               Navigator.pushNamed(context, AppRoutes.accountSecurity);
            },
          ),
          CustomProfileListTile(
            leading:const Icon(Icons.calendar_today_outlined),
            title: 'My Booking',
            trailing:const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.bookings);
            },
          ),
          const CustomProfileListTile(
            leading: Icon(Icons.language),
            title: 'App Language',
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
           CustomProfileListTile(
            leading: Transform.rotate(
              angle: 3.1416, 
              child: const Icon(Icons.logout, color: Colors.red),
            ),
            title: 'LogOut',
          ),
        ],
      ),
    );
  }
}
