import 'package:im_bored_app/core/result_types/result.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/domain/repositories/activity_repository.dart';

class GetRandomActivity {
  final ActivityRepositoryContract repositoryContract;

  GetRandomActivity({required this.repositoryContract});

  Future<Result<ActivityEntity>> execute() {
    return repositoryContract.getRandomActivity();
  }
}

class GetActivityByType {
  final ActivityRepositoryContract repositoryContract;

  GetActivityByType({required this.repositoryContract});

  Future<Result<ActivityEntity>> execute(String type) {
    return repositoryContract.getActivityByType(type);
  }
}

class GetFavoriteActivities {
  final ActivityRepositoryContract repositoryContract;

  GetFavoriteActivities({required this.repositoryContract});

  Future<Result<List<ActivityEntity>>> execute() {
    return repositoryContract.getFavoriteActivities();
  }
}

class SaveActivityAsFavorite {
  final ActivityRepositoryContract repositoryContract;

  SaveActivityAsFavorite({required this.repositoryContract});

  Future<bool> execute(ActivityEntity entity) {
    return repositoryContract.saveActivityAsFavorite(entity);
  }
}
