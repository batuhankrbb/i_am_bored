import 'package:im_bored_app/core/result_types/state_result.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/domain/usecases/activities_usecases.dart';
import 'package:mobx/mobx.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesViewModel = _FavoritesViewModel with _$FavoritesViewModel;

abstract class _FavoritesViewModel with Store {
  final GetFavoriteActivities getFavoriteActivities;
  final DeleteFavoriteActivity deleteFavoriteActivity;

  _FavoritesViewModel({required this.getFavoriteActivities, required this.deleteFavoriteActivity});

  StateResult<List<ActivityEntity>> favoriteActivities = StateResult.initial();
}
