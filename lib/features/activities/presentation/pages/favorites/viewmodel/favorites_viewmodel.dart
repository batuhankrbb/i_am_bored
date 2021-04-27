import 'package:mobx/mobx.dart';

import '../../../../../../core/result_types/state_result.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/usecases/activities_usecases.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesViewModel = _FavoritesViewModel with _$FavoritesViewModel;

abstract class _FavoritesViewModel with Store {
  final GetFavoriteActivities getFavoriteActivities;
  final DeleteFavoriteActivity deleteFavoriteActivity;

  _FavoritesViewModel({required this.getFavoriteActivities, required this.deleteFavoriteActivity});

  StateResult<List<ActivityEntity>> favoriteActivities = StateResult.initial();
}
