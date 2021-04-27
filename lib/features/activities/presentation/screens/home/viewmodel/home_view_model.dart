import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/utils/activity_types.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/result_types/state_result.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  final GetRandomActivity getRandomActivityUseCase;
  final GetActivityByType getActivityByTypeUseCase;
  final SaveActivityAsFavorite saveActivityAsFavoriteUseCase;
  BuildContext context;

  _HomeViewModel(
      {required this.getRandomActivityUseCase,
      required this.getActivityByTypeUseCase,
      required this.saveActivityAsFavoriteUseCase,
      required this.context});

  @action
  Future<void> getActivityByType(ActivityType type) async {
    activityStateResult = StateResult.loading();
    var result = await getActivityByTypeUseCase.execute(type.rawValue);
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

  @action
  Future<void> saveActivityAsFavorite(ActivityEntity entity) async {
    activityStateResult = StateResult.loading();
    var result = await saveActivityAsFavoriteUseCase.execute(entity);
    result.when(success: (_) {
      _showAlertDialog("Activity is added to favorite successfully.");
    }, failure: (failure) {
      _showAlertDialog(failure.message);
    });
  }

  _showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hello"),
            content: Text(message),
          );
        });
  }

  @observable
  StateResult<ActivityEntity> activityStateResult = StateResult.initial();
}

//getactivitybytype
//getrandomactivity
////activityresultstate
///types will be enum. I will change all types and make it string in repository layer
