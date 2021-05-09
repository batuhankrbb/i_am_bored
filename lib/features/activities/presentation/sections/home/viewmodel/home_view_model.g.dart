// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
  final _$selectedActivityTypeAtom =
      Atom(name: '_HomeViewModel.selectedActivityType');

  @override
  String get selectedActivityType {
    _$selectedActivityTypeAtom.reportRead();
    return super.selectedActivityType;
  }

  @override
  set selectedActivityType(String value) {
    _$selectedActivityTypeAtom.reportWrite(value, super.selectedActivityType,
        () {
      super.selectedActivityType = value;
    });
  }

  final _$activityStateResultAtom =
      Atom(name: '_HomeViewModel.activityStateResult');

  @override
  StateResult<ActivityEntity> get activityStateResult {
    _$activityStateResultAtom.reportRead();
    return super.activityStateResult;
  }

  @override
  set activityStateResult(StateResult<ActivityEntity> value) {
    _$activityStateResultAtom.reportWrite(value, super.activityStateResult, () {
      super.activityStateResult = value;
    });
  }

  final _$isCurrentActivityFavoriteAtom =
      Atom(name: '_HomeViewModel.isCurrentActivityFavorite');

  @override
  bool get isCurrentActivityFavorite {
    _$isCurrentActivityFavoriteAtom.reportRead();
    return super.isCurrentActivityFavorite;
  }

  @override
  set isCurrentActivityFavorite(bool value) {
    _$isCurrentActivityFavoriteAtom
        .reportWrite(value, super.isCurrentActivityFavorite, () {
      super.isCurrentActivityFavorite = value;
    });
  }

  final _$getActivityByTypeAsyncAction =
      AsyncAction('_HomeViewModel.getActivityByType');

  @override
  Future<void> getActivityByType() {
    return _$getActivityByTypeAsyncAction.run(() => super.getActivityByType());
  }

  final _$getRandomActivityAsyncAction =
      AsyncAction('_HomeViewModel.getRandomActivity');

  @override
  Future<void> getRandomActivity() {
    return _$getRandomActivityAsyncAction.run(() => super.getRandomActivity());
  }

  final _$favoriteButtonPressedAsyncAction =
      AsyncAction('_HomeViewModel.favoriteButtonPressed');

  @override
  Future<void> favoriteButtonPressed(ActivityEntity entity) {
    return _$favoriteButtonPressedAsyncAction
        .run(() => super.favoriteButtonPressed(entity));
  }

  final _$_saveActivityAsFavoriteAsyncAction =
      AsyncAction('_HomeViewModel._saveActivityAsFavorite');

  @override
  Future<void> _saveActivityAsFavorite(ActivityEntity entity) {
    return _$_saveActivityAsFavoriteAsyncAction
        .run(() => super._saveActivityAsFavorite(entity));
  }

  final _$_removeActivityFromFavoriteAsyncAction =
      AsyncAction('_HomeViewModel._removeActivityFromFavorite');

  @override
  Future<void> _removeActivityFromFavorite(ActivityEntity entity) {
    return _$_removeActivityFromFavoriteAsyncAction
        .run(() => super._removeActivityFromFavorite(entity));
  }

  @override
  String toString() {
    return '''
selectedActivityType: ${selectedActivityType},
activityStateResult: ${activityStateResult},
isCurrentActivityFavorite: ${isCurrentActivityFavorite}
    ''';
  }
}
