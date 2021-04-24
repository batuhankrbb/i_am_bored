import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/local_data_source_contract.dart';
import 'package:im_bored_app/features/activities/data/data_sources/contracts/remote_data_source_contract.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/domain/repositories/activity_repository.dart';

class ActivityRepositoryImplementation implements ActivityRepositoryContract {
  final ActivityLocalDataSourceContract localDataSourceContract;
  final ActivityRemoteDataSourceContract remoteDataSourceContract;

  ActivityRepositoryImplementation({
    required this.localDataSourceContract,
    required this.remoteDataSourceContract,
  });

  @override
  Future<Result<ActivityEntity>> getActivityByType(String type) async {
    var activity = await remoteDataSourceContract
        .getActivityByType(type); //do error handling
    return Result<ActivityEntity>.success(activity.toEntity());
  }

  @override
  Future<Result<List<ActivityEntity>>> getFavoriteActivities() async {
    var activities = await localDataSourceContract.getFavoriteActivities();
    return Success(activities.map((e) => e.toEntity()).toList());
  }

  @override
  Future<Result<ActivityEntity>> getRandomActivity() async {
    var activity = await remoteDataSourceContract.getRandomActivity();
    return Success(activity.toEntity());
  }

  @override
  Future<bool> saveActivityAsFavorite(ActivityEntity activity) async {
    var result =
        await localDataSourceContract.saveActivityAsFavorite(activity.model);
    return result;
  }
}
