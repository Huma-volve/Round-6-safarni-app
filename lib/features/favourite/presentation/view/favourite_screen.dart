import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/favourite/presentation/business_logic/favourite_cubit.dart';
import 'package:safarni/features/favourite/presentation/widgets/fav_item_widget.dart';

import '../../../../core/constants/app_styles.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit()..getAllFavourites(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text('Favourite', style: AppStyles.addressesTextStyle),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.homeScreen);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey900,
              size: 24.sp,
            ),
          ),
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavouriteLoaded) {
              return ListView.builder(
                // shrinkWrap: true,
                itemCount: state.favourites.length,
                itemBuilder: (context, index) {
                  return FavItemWidget(
                    favouriteModel: state.favourites[index],
                    onTap: () {
                      context.read<FavouriteCubit>().removeFromFavourites(
                        state.favourites[index].id,
                      );
                    },
                  );
                },
              );
            } else if (state is FavouriteError) {
              return Center(child: Text(state.error));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

// class FavouriteScreen extends StatefulWidget {
//   const FavouriteScreen({super.key});

//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }

// class _FavouriteScreenState extends State<FavouriteScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FavouriteCubit()..getAllFavourites(),
//       child: Scaffold(
//         backgroundColor: AppColors.white,

//         centerTitle: true,
//         title: Text('Favourite', style: AppStyles.addressesTextStyle),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pushNamed(AppRoutes.homeScreen);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: AppColors.grey900,
//             size: 24.sp,
//           ),
//         ),
//       ),
//       body: favouriteToursWithIndex.isEmpty
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.favorite_border,
//                     size: 64.sp,
//                     color: AppColors.grey400,
//                   ),
//                   SizedBox(height: 16.h),
//                   Text(
//                     'No favourite tours yet',
//                     style: AppStyles.titleTourSearchStyle.copyWith(
//                       color: AppColors.grey400,
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : ListView.builder(
//               shrinkWrap: true,
//               itemCount: favouriteToursWithIndex.length,
//               itemBuilder: (context, index) {
//                 final int originalTourIndex =
//                     favouriteToursWithIndex[index].key;
//                 return FavItemWidget(
//                   tourIndex: originalTourIndex,
//                   //TODO : will try remove it
//                 );
//               },
//             ),

//         appBar: AppBar(
//           backgroundColor: AppColors.white,
//           centerTitle: true,
//           title: Text('Favourite', style: AppStyles.addressesTextStyle),
//           leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed(AppRoutes.homeScreen);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: AppColors.grey900,
//               size: 24.sp,
//             ),
//           ),
//         ),
//         body: BlocBuilder<FavouriteCubit, FavouriteState>(
//           builder: (context, state) {
//             if (state is FavouriteLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is FavouriteLoaded) {
//               return ListView.builder(
//                 // shrinkWrap: true,
//                 itemCount: state.favourites.length,
//                 itemBuilder: (context, index) {
//                   return FavItemWidget(
//                     favouriteModel: state.favourites[index],
//                     onTap: () {
//                       context.read<FavouriteCubit>().removeFromFavourites(
//                         state.favourites[index].id,
//                       );
//                     },
//                   );
//                 },
//               );
//             } else if (state is FavouriteError) {
//               return Center(child: Text(state.error));
//             } else {
//               return const SizedBox.shrink();
//             }
//           },
//         ),
//       ),

//     );
//   }
// }

/*
favouriteToursWithIndex.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 64.sp,
                color: AppColors.grey400,
              ),
              SizedBox(height: 16.h),
              Text(
                'No favourite tours yet',
                style: AppStyles.titleTourSearchStyle.copyWith(
                  color: AppColors.grey400,
                ),
              ),
            ],
          ),
        )
            :
 */
