import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/result_types/state_result.dart';
import '../../../../../../core/user_interface/helpers/alert_helper.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesViewModel = _FavoritesViewModel with _$FavoritesViewModel;

abstract class _FavoritesViewModel with Store {
  final GetFavoriteActivities getFavoriteActivitiesUseCase;
  final DeleteFavoriteActivity deleteFavoriteActivityUseCase;
  late BuildContext context;

  _FavoritesViewModel({
    required this.getFavoriteActivitiesUseCase,
    required this.deleteFavoriteActivityUseCase,
  });

  var _alertHelper = AlertHelper();

  @observable
  StateResult<List<ActivityEntity>> favoriteActivities = StateResult.initial();

  @observable
  ObservableList<ActivityEntity> favoriteActivitiesForInterface =
      ObservableList<ActivityEntity>();

  void setContext(BuildContext context) {
    this.context = context;
  }

  @action
  Future<void> onDismiss(DismissDirection direction, int index) async {
    if (direction == DismissDirection.endToStart) {
      deleteFavoriteActivity(favoriteActivitiesForInterface[index].key);
    }
  }

  @action
  Future<void> getAllFavorites() async {
    favoriteActivities = StateResult.loading();
    var favorites = await getFavoriteActivitiesUseCase.execute();
    favorites.when(success: (data) {
      favoriteActivities = StateResult.completed(data);
      favoriteActivitiesForInterface.clear();
      favoriteActivitiesForInterface.addAll(data);
    }, failure: (failure) {
      favoriteActivities = StateResult.failed(failure);
    });
  }

  @action
  Future<void> deleteFavoriteActivity(String key) async {
    var result = await deleteFavoriteActivityUseCase.execute(key);
    result.when(success: (_) {
      favoriteActivitiesForInterface
          .removeWhere((element) => element.key == key);
    }, failure: (failure) {
      _alertHelper.showCupertinoAlertDialog("Bad News", failure.message, context);
    });
  }
}