import 'package:flutter/material.dart';
import 'package:im_bored_app/features/activities/utils/activity_types.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/result_types/state_result.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesViewModel = _FavoritesViewModel with _$FavoritesViewModel;

abstract class _FavoritesViewModel with Store {
  final GetFavoriteActivities getFavoriteActivitiesUseCase;
  final DeleteFavoriteActivity deleteFavoriteActivityUseCase;
  BuildContext context;

  _FavoritesViewModel(
      {required this.getFavoriteActivitiesUseCase,
      required this.deleteFavoriteActivityUseCase,
      required this.context});

  @observable
  StateResult<List<ActivityEntity>> favoriteActivities = StateResult.initial();

  @action
  Future<void> getAllFavorites() async {
    favoriteActivities = StateResult.loading();
    var favorites = await getFavoriteActivitiesUseCase.execute();
    favorites.when(success: (data) {
      favoriteActivities = StateResult.completed(data);
    }, failure: (failure) {
      favoriteActivities = StateResult.failed(failure);
    });
  }

  @action
  Future<void> deleteFavoriteActivity(String key) async {
    var result = await deleteFavoriteActivityUseCase.execute(key);
    result.when(success: (_) {
      _showAlertDialog("You deleted the activity.");
    }, failure: (failure) {
      _showAlertDialog(failure.message);
    });
  }

  void _showAlertDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Great!"),
            content: Text(message),
          );
        });
  }
}

//alert olayları yine. Snake bar da olabilir.
