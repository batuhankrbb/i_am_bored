// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesViewModel on _FavoritesViewModel, Store {
  final _$favoriteActivitiesAtom =
      Atom(name: '_FavoritesViewModel.favoriteActivities');

  @override
  StateResult<List<ActivityEntity>> get favoriteActivities {
    _$favoriteActivitiesAtom.reportRead();
    return super.favoriteActivities;
  }

  @override
  set favoriteActivities(StateResult<List<ActivityEntity>> value) {
    _$favoriteActivitiesAtom.reportWrite(value, super.favoriteActivities, () {
      super.favoriteActivities = value;
    });
  }

  final _$getAllFavoritesAsyncAction =
      AsyncAction('_FavoritesViewModel.getAllFavorites');

  @override
  Future<void> getAllFavorites() {
    return _$getAllFavoritesAsyncAction.run(() => super.getAllFavorites());
  }

  final _$deleteFavoriteActivityAsyncAction =
      AsyncAction('_FavoritesViewModel.deleteFavoriteActivity');

  @override
  Future<void> deleteFavoriteActivity(String key) {
    return _$deleteFavoriteActivityAsyncAction
        .run(() => super.deleteFavoriteActivity(key));
  }

  @override
  String toString() {
    return '''
favoriteActivities: ${favoriteActivities}
    ''';
  }
}
