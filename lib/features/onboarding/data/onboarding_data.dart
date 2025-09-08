import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/features/onboarding/domain/entities/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: Assets.imagesOnboardingImg1,
    title: AppStrings.findYourDreamAdventureHere,
  ),
  OnboardingModel(
    image: Assets.imagesOnboardingImg2,
    title: AppStrings.easilySaveYourFavoriteJourneys,
  ),
  OnboardingModel(
    image: Assets.imagesOnboardingImg3,
    title: AppStrings.planYourDreamTripWithTripMate,
  ),
];
