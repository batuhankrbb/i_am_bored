import '../../../../core/network_checking/network_checker_contract.dart';
import '../../../../core/result_types/result.dart';
import '../../domain/entities/activity_entity.dart';
import '../../domain/repositories/activity_repository.dart';
import '../data_sources/contracts/local_data_source_contract.dart';
import '../data_sources/contracts/remote_data_source_contract.dart';
import '../data_sources/exceptions/activity_exceptions.dart';
import '../exception_handling/activity_exception_handler.dart';
import '../models/activity_model.dart';

class ActivityRepositoryImplementation implements ActivityRepositoryContract {
  final ActivityLocalDataSourceContract localDataSourceContract;
  final ActivityRemoteDataSourceContract remoteDataSourceContract;
  final NetworkCheckerContract networkCheckerContract;
  final ActivityExceptionHandler exceptionHandler;

  ActivityRepositoryImplementation(
      {required this.localDataSourceContract,
      required this.remoteDataSourceContract,
      required this.networkCheckerContract,
      required this.exceptionHandler});

  @override
  Future<Result<ActivityEntity>> getActivityByType(String type) async {
    try {
      return _fetchFromNetworkWithNetworkChecking(() {
        return remoteDataSourceContract.getActivityByType(type);
      });
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<ActivityEntity>> getRandomActivity() async {
    try {
      return _fetchFromNetworkWithNetworkChecking(() {
        return remoteDataSourceContract.getRandomActivity();
      });
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<List<ActivityEntity>>> getFavoriteActivities() async {
    try {
      var activities = await localDataSourceContract
          .getFavoriteActivities(); //check error handling -type 1
      return Success(activities.map((e) => e.toEntity()).toList());
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<bool>> saveActivityAsFavorite(ActivityEntity activity) async {
    try {
      var result =
          await localDataSourceContract.saveActivityAsFavorite(activity.model);
      return Result.success(result);
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<bool>> deleteFavoriteActivity(String key) async {
    try {
      return localDataSourceContract.deleteFavoriteActivity(key);
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  Future<ActivityModel> _getLastFavorite() async {
    var lastFavorite = await localDataSourceContract.getLastFavoriteActivity();
    return lastFavorite;
  }

  Future<Result<ActivityEntity>> _fetchFromNetworkWithNetworkChecking(
      Future<ActivityModel> Function() getActivity) async {
    if (await networkCheckerContract.isConnected()) {
      var activity = await getActivity(); //check error handling -type 2
      return Result<ActivityEntity>.success(activity.toEntity());
    } else {
      var activity =
          await _getLastFavorite(); //it's already checked in _getLastFavorite
      return Result<ActivityEntity>.success(activity.toEntity());
    }
  }
}
