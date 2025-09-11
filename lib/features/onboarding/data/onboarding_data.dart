import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/features/onboarding/domain/entities/onboarding_model.dart';

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: AppImages.assetsImagesOnboardingImg1,
    title: AppStrings.findYourDreamAdventureHere,
  ),
  OnboardingModel(
    image: AppImages.assetsImagesOnboardingImg2,
    title: AppStrings.easilySaveYourFavoriteJourneys,
  ),
  OnboardingModel(
    image: AppImages.assetsImagesOnboardingImg3,
    title: AppStrings.planYourDreamTripWithTripMate,
  ),
];
