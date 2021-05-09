import 'package:flutter/material.dart';
import '../../../../../../core/result_types/state_result.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';
import '../../../../utils/activity_types.dart';
import 'package:mobx/mobx.dart';
import 'package:im_bored_app/features/activities/utils/activity_constants.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final GetRandomActivity getRandomActivityUseCase;
  final GetActivityByType getActivityByTypeUseCase;
  final SaveActivityAsFavorite saveActivityAsFavoriteUseCase;
  final DeleteFavoriteActivity deleteFavoriteActivityUseCase;
  late BuildContext context;

  _HomeViewModel(
      {required this.getRandomActivityUseCase,
      required this.getActivityByTypeUseCase,
      required this.saveActivityAsFavoriteUseCase,
      required this.deleteFavoriteActivityUseCase});

  List<String> get allActivities {
    return ActivityConstants().allActivityTypes.map((e) => e.rawValue).toList();
  }

  @observable
  var selectedActivityType = ActivityType.relaxation.rawValue;

  @observable
  StateResult<ActivityEntity> activityStateResult = StateResult.initial();

  @observable
  bool isCurrentActivityFavorite = false;

  void setContext(BuildContext context) {
    this.context = context;
  }

  void changeCurrentActivityType(int index) {
    selectedActivityType = allActivities[index];
  }

  @action
  Future<void> getActivityByType() async {
    activityStateResult = StateResult.loading();
    var result = await getActivityByTypeUseCase.execute(selectedActivityType);
    result.when(success: (data) {
      isCurrentActivityFavorite = false;
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
      isCurrentActivityFavorite = false;
      activityStateResult = StateResult.completed(data);
    }, failure: (failure) {
      activityStateResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> favoriteButtonPressed() async {
    if (isCurrentActivityFavorite) {
      _removeActivityFromFavorite();
    } else {
      _saveActivityAsFavorite();
    }
  }

  @action
  Future<void> _saveActivityAsFavorite() async {
    activityStateResult.maybeWhen(
      orElse: () => null,
      completed: (data) async {
        var result = await saveActivityAsFavoriteUseCase.execute(data);
        result.when(success: (_) {
          isCurrentActivityFavorite = true;
        }, failure: (failure) {
          _showAlertDialog(failure.message);
        });
      },
    );
  }

  @action
  Future<void> _removeActivityFromFavorite() async {
    activityStateResult.maybeWhen(
      orElse: () => null,
      completed: (data) async {
        var result = await deleteFavoriteActivityUseCase.execute(data.key);
        result.when(success: (_) {
          isCurrentActivityFavorite = true;
        }, failure: (failure) {
          _showAlertDialog(failure.message);
        });
      },
    );
  }

  void _showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("sad :("),
            content: Text(message),
          );
        });
  }
}

//* alertleri düzenle. Belki bi alerthelper yap
