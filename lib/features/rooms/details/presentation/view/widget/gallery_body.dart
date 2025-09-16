import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/helper/custom_snack_bar.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/add_gallery_use_case.dart';
import 'package:safarni/features/rooms/details/domain/room_details_use_case/display_gallery_use_case.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/add_gallery/add_gallery_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_gallery/display_gallery_cubit.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_gallery.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/gallery_image_list_view.dart';

class GalleryBody extends StatelessWidget {
  const GalleryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddGalleryCubit(sl.get<AddGalleryUseCase>()),
        ),
        BlocProvider(
          create: (context) =>
              DisplayGalleryCubit(sl.get<DisplayGalleryUseCase>())
                ..getGalleries(),
        ),
      ],
      child: const GalleryBodyContent(),
    );
  }
}

class GalleryBodyContent extends StatelessWidget {
  const GalleryBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomGallery(
          onImageSelected: (image) {
            context.read<AddGalleryCubit>().addGallery(image: image).then((_) {
              customSnackBar(context, 'Image added successfully');
              context.read<DisplayGalleryCubit>().getGalleries();
            });
          },
        ),
        const SizedBox(height: 16),

        const GalleryImageListView(),
      ],
    );
  }
}
