import 'package:im_bored_app/core/result_types/state_result.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/domain/usecases/activities_usecases.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final GetRandomActivity getRandomActivityUseCase;
  final GetActivityByType getActivityByTypeUseCase;
  final SaveActivityAsFavorite saveActivityAsFavoriteUseCase;

  _HomeViewModel(
      {required this.getRandomActivityUseCase,
      required this.getActivityByTypeUseCase,
      required this.saveActivityAsFavoriteUseCase});

  @action
  Future<void> getActivityByType(String type) async {
    activityStateResult = StateResult.loading();
    var result = await getActivityByTypeUseCase
        .execute(type); //bu şekilde diğer metodu da doldur
    result.when(success: (data) {
      activityStateResult = StateResult.completed(data);
    }, failure: (failure) {
      activityStateResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> getRandomActivity() async {
    activityStateResult = StateResult.loading();
    var result = await getRandomActivityUseCase.execute();
    result.when(success: (data) {
      activityStateResult = StateResult.completed(data);
    }, failure: (failure) {
      activityStateResult = StateResult.failed(failure);
    });
  }

  @observable
  StateResult<ActivityEntity> activityStateResult = StateResult.initial();
}

//getactivitybytype
//getrandomactivity
////activityresultstate
///types will be enum. I will change all types and make it string in repository layer
