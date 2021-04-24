import 'package:im_bored_app/core/network_checking/network_checker_contract.dart';
import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/local_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/remote_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/models/activity_model.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/domain/repositories/activity_repository.dart';

class ActivityRepositoryImplementation implements ActivityRepositoryContract {
  final ActivityLocalDataSourceContract localDataSourceContract;
  final ActivityRemoteDataSourceContract remoteDataSourceContract;
  final NetworkCheckerContract networkCheckerContract;

  ActivityRepositoryImplementation(
      {required this.localDataSourceContract,
      required this.remoteDataSourceContract,
      required this.networkCheckerContract});

  @override
  Future<Result<ActivityEntity>> getActivityByType(String type) async {
    return fetchFromNetworkWithNetworkChecking(() {
      return remoteDataSourceContract.getActivityByType(type);
    });
  }

  @override
  Future<Result<ActivityEntity>> getRandomActivity() async {
    return fetchFromNetworkWithNetworkChecking(() {
      return remoteDataSourceContract.getRandomActivity();
    });
  }

  @override
  Future<Result<List<ActivityEntity>>> getFavoriteActivities() async {
    var activities = await localDataSourceContract.getFavoriteActivities();
    return Success(activities.map((e) => e.toEntity()).toList());
  }

  @override
  Future<bool> saveActivityAsFavorite(ActivityEntity activity) async {
    var result =
        await localDataSourceContract.saveActivityAsFavorite(activity.model);
    return result;
  }

  Future<ActivityModel> _getLastFavorite() async {
    var lastFavorite = await localDataSourceContract.getLastFavoriteActivity();
    return lastFavorite;
  }

  Future<Result<ActivityEntity>> fetchFromNetworkWithNetworkChecking(
      Future<ActivityModel> Function() getActivity) async {
    if (await networkCheckerContract.isConnected()) {
      var activity = await getActivity();
      return Result<ActivityEntity>.success(activity.toEntity());
    } else {
      var activity = await _getLastFavorite();
      return Result<ActivityEntity>.success(activity.toEntity());
    }
  }
}
