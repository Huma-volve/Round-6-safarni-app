// presentation/cubit/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/get_user_profile.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileEntity user;
  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfile getUserProfile;

  ProfileCubit(this.getUserProfile) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());
    try {
      final user = await getUserProfile('123'); // Pass a user ID
      emit(ProfileLoaded(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
