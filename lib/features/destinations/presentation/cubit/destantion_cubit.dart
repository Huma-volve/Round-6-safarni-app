import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safarni/features/destinations/domain/entity/activities.dart';
import 'package:safarni/features/destinations/domain/entity/destantion.dart';
import 'package:safarni/features/destinations/domain/entity/review.dart';
import 'package:safarni/features/destinations/domain/usecases/destantion_use_case.dart';
import 'package:safarni/features/destinations/domain/usecases/get_all_activities_use_case.dart';
import 'package:safarni/features/destinations/domain/usecases/get_all_reviwes_use_case.dart';

part 'destantion_state.dart';

class DestantionCubit extends Cubit<DestantionState> {
  final DestantionUseCase destantionUseCase;
  final GetAllReviwesUseCase getAllReviwesUseCase;
  final GetAllActivitiesUesCase getAllActivitiesUseCase;
  DestantionCubit(
    this.destantionUseCase,
    this.getAllReviwesUseCase,
    this.getAllActivitiesUseCase,
  ) : super(DestantionInitial());

  // get destantion data
  Future<void> getDestantion(int destId) async {
    emit(DestantionLoading());
    final result = await destantionUseCase.execute(destId);
    result.fold(
      (l) => emit(DestantionError(l.message)),
      (r) => emit(DestantionSuccess(r)),
    );
  }

  // get reviews data
  Future<void> getReviews(int reviwesId) async {
    emit(ReviewsLoading());
    final result = await getAllReviwesUseCase.execute(reviwesId);
    result.fold(
      (l) => emit(ReviewsError(l.message)),
      (r) => emit(ReviewsSuccess(r)),
    );
  }

  // get activities data
  Future<void> getActivities() async {
    emit(ActivitiesLoading());
    final result = await getAllActivitiesUseCase.execute();
    result.fold(
      (l) => emit(ActivitiesError(l.message)),
      (r) => emit(ActivitiesSuccess(r)),
    );
  }
}
