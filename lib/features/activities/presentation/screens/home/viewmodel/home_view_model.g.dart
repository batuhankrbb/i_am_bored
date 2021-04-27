// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModel, Store {
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

  final _$getActivityByTypeAsyncAction =
      AsyncAction('_HomeViewModel.getActivityByType');

  @override
  Future<void> getActivityByType(ActivityType type) {
    return _$getActivityByTypeAsyncAction
        .run(() => super.getActivityByType(type));
  }

  final _$getRandomActivityAsyncAction =
      AsyncAction('_HomeViewModel.getRandomActivity');

  @override
  Future<void> getRandomActivity() {
    return _$getRandomActivityAsyncAction.run(() => super.getRandomActivity());
  }

  final _$saveActivityAsFavoriteAsyncAction =
      AsyncAction('_HomeViewModel.saveActivityAsFavorite');

  @override
  Future<void> saveActivityAsFavorite(ActivityEntity entity) {
    return _$saveActivityAsFavoriteAsyncAction
        .run(() => super.saveActivityAsFavorite(entity));
  }

  @override
  String toString() {
    return '''
activityStateResult: ${activityStateResult}
    ''';
  }
}
