import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/result_types/state_result.dart';
import '../../../../../../core/user_interface/helpers/alert_helper.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';
import '../../../../utils/activity_constants.dart';
import '../../../../utils/activity_types.dart';

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

  AlertHelper _alertHelper = AlertHelper();

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
  Future<void> favoriteButtonPressed(ActivityEntity entity) async {
    if (isCurrentActivityFavorite) {
      await _removeActivityFromFavorite(entity);
    } else {
      await _saveActivityAsFavorite(entity);
    }
  }

  @action
  Future<void> _saveActivityAsFavorite(ActivityEntity entity) async {
    var result = await saveActivityAsFavoriteUseCase.execute(entity);
    result.when(success: (_) {
      isCurrentActivityFavorite = true;
    }, failure: (failure) {
      _alertHelper.showCupertinoAlertDialog("Bad News", failure.message, context);
    });
  }

  @action
  Future<void> _removeActivityFromFavorite(ActivityEntity entity) async {
    var result = await deleteFavoriteActivityUseCase.execute(entity.key);
    result.when(success: (_) {
      isCurrentActivityFavorite = false;
    }, failure: (failure) {
     _alertHelper.showCupertinoAlertDialog("Bad News", failure.message, context);
    });
  }

}
