import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/assets.dart';
import 'package:safarni/features/onboarding/domain/entities/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: Assets.assetsImagesOnboardingImg1,
    title: AppStrings.findYourDreamAdventureHere,
  ),
  OnboardingModel(
    image: Assets.assetsImagesOnboardingImg2,
    title: AppStrings.easilySaveYourFavoriteJourneys,
  ),
  OnboardingModel(
    image: Assets.assetsImagesOnboardingImg3,
    title: AppStrings.planYourDreamTripWithTripMate,
  ),
];
