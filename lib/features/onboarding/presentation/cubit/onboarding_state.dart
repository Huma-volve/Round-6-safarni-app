part of 'onboarding_cubit.dart';

abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  OnboardingLoaded();
}

class OnboardingFinished extends OnboardingState {}
