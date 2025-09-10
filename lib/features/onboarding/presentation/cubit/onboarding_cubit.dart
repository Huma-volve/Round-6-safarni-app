import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';
import 'package:safarni/features/onboarding/domain/entities/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  late List<OnboardingModel> onboardingPages;
  loadOnboardingPages() {
    onboardingPages = onboardingData;
    emit(OnboardingLoaded());
  }

  void completeOnboarding() {
    emit(OnboardingFinished());
  }
}
