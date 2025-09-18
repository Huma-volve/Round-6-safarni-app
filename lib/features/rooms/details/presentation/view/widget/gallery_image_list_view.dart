import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/model/empty_data_model.dart';
import 'package:safarni/core/widgets/custom_empty_data.dart';
import 'package:safarni/core/widgets/custom_local_image.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_gallery/display_gallery_cubit.dart';

class GalleryImageListView extends StatelessWidget {
  const GalleryImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayGalleryCubit, DisplayGalleryState>(
      builder: (context, state) {
        if (state is DisplayGallerySuccess) {
          if (state.galleries.isEmpty) {
            return CustomEmptyData(emptyDataModel: EmptyDataModel.list[1]);
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
            child: ListView.builder(
              itemCount: state.galleries.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                log(state.galleries[index].image.toString());
                return Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: CustomLocalImage(
                    image: state.galleries[index].image.toString(),
                  ),
                );
              },
            ),
          );
        } else if (state is DisplayGalleryFailure) {
          return ErrorWidget(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
