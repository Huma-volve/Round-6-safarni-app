import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing.dart';
import 'package:safarni/features/favourite/presentation/business_logic/favourite_cubit.dart';
import 'package:safarni/features/result_search/presentation/widgets/custom_card_search.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../favourite/data/models/favourite_model.dart';
import '../business_logic/result_search/result_search_cubit.dart';

class ResultOfSearchScreen extends StatefulWidget {
  final String? title;

  const ResultOfSearchScreen({super.key, this.title});

  @override
  State<ResultOfSearchScreen> createState() => _ResultOfSearchScreenState();
}

class _ResultOfSearchScreenState extends State<ResultOfSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResultSearchCubit()..getAllSearchTours(),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit()..getAllFavourites(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey900,
              size: 24.sp,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                color: AppColors.grey900,
                size: 24.sp,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushNamed(AppRoutes.filterScreen, arguments: widget.title);
              },
              icon: Icon(
                Icons.edit_note_outlined,
                color: AppColors.grey900,
                size: 24.sp,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ResultSearchCubit, ResultSearchState>(
          builder: (context, state) {
            if (state is ResultSearchLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ResultSearchLoaded) {
              return Column(
                children: [
                  const HeightSpace(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(widget.title ?? '', style: AppStyles.townName),
                        const WidthSpace(width: 7),
                        Text(
                          ' ${state.results.length} Results',
                          style: AppStyles.bottomNavTitle.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<FavouriteCubit, FavouriteState>(
                      builder: (context, favState) {
                        List<FavouriteModel> favs = [];
                        if (favState is FavouriteLoaded) {
                          favs = favState.favourites;
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            final constant = state.results[index];
                            final favModel = FavouriteModel(
                              id: constant.id,
                              title: constant.title,
                              image: constant.image,
                              price: constant.price,
                              location: '',
                              description: '',
                              views: constant.views,
                              rating: constant.rating,
                            );

                            final isFav = favs.any((item) => item.id == favModel.id);

                            return CustomCardSearch(
                              resultItemModel: constant,
                              delay: index * 100,
                              onTap: () {
                                context.read<FavouriteCubit>().toggleFavourite(favModel);
                              },
                              isFavourite: isFav,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ResultSearchError) {
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
