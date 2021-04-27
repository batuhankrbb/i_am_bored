import '../../../../core/network/network_checking/network_checker_contract.dart';
import '../../../../core/result_types/result.dart';
import '../../domain/entities/activity_entity.dart';
import '../../domain/repositories/activity_repository.dart';
import '../data_sources/contracts/local_data_source_contract.dart';
import '../data_sources/contracts/remote_data_source_contract.dart';
import '../exception_handling/exceptions/activity_exceptions.dart';
import '../exception_handling/handler/activity_exception_handler.dart';
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
      var activities = await localDataSourceContract.getFavoriteActivities();
      return Success(activities);
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> saveActivityAsFavorite(ActivityEntity activity) async {
    try {
      var result =
          await localDataSourceContract.saveActivityAsFavorite(activity);
      return Result.success(result);
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> deleteFavoriteActivity(String key) async {
    try {
      var result = await localDataSourceContract.deleteFavoriteActivity(key);
      return Result.success(result);
    } on ActivityException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  Future<Result<ActivityEntity>> _getCachedActivity() async {
    try {
      var cachedActivity = await localDataSourceContract.getCachedActivity();
      return Result.success(cachedActivity);
    } on ActivityException catch (e) {
       return Result.failure(exceptionHandler.handleException(e));
    }
  }

  Future<Result<ActivityEntity>> _fetchFromNetworkWithNetworkChecking(
      Future<ActivityModel> Function() getActivity) async {
    if (await networkCheckerContract.isConnected()) {
      var activity = await getActivity();
      return Result<ActivityEntity>.success(activity.toEntity());
    } else {
      var activity = await _getCachedActivity();
      return activity;
    }
  }
}
