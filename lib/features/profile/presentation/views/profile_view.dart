import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:safarni/core/widgets/custom_profile_listTile.dart';
import 'package:safarni/features/profile/presentation/views/personal_information_view.dart';
import '../../data/datasources/user_remote_data_source.dart';
import '../../data/repositories/user_repositry_impl.dart';
import '../../domain/entities/profile_entity.dart';
import '../cubits/profile_cubit.dart';
import '../../domain/usecases/get_user_profile.dart';

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

  Widget profileBody(UserEntity user, BuildContext context) {
    return  Column(
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
          leading:const Icon(Icons.person),
          title: 'Personal Info',
          trailing: const Icon(Icons.arrow_forward_ios, size: 16,), 
         onTap: () {
            Navigator.pushNamed(context, '/personal_info');
          },
              ),
              
        
        CustomProfileListTile(
          leading:const Icon(Icons.lock),
          title: 'Account & Security',
          trailing: const  Icon(Icons.arrow_forward_ios, size: 16),
           onTap: () {
            Navigator.pushNamed(
              context,
             '/account_security',
              
            );
          },
        ),
       const CustomProfileListTile(
          leading: Icon(Icons.book),
          title: 'My Booking',
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
       const CustomProfileListTile(
          leading: Icon(Icons.language),
          title: 'App Language',
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
       const CustomProfileListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: 'LogOut',
        ),
      ],
    );
  }
}
