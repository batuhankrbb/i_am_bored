import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

import '../../../core/network/network_checking/network_checker_contract.dart';
import '../../../core/network/network_checking/network_checker_implementation.dart';
import '../data/data_sources/contracts/local_data_source_contract.dart';
import '../data/data_sources/contracts/remote_data_source_contract.dart';
import '../data/data_sources/implementations/local_data_source_implementation.dart';
import '../data/data_sources/implementations/remote_data_source_implementation.dart';
import '../data/exception_handling/handler/activity_exception_handler.dart';
import '../data/repositories/activity_repository_implementation.dart';
import '../domain/repositories/activity_repository.dart';
import '../domain/usecases/activities_usecases.dart';
import '../presentation/sections/favorites/viewmodel/favorites_viewmodel.dart';
import '../presentation/sections/home/viewmodel/home_view_model.dart';

GetIt getit = GetIt.instance;

void setUpGetIt() {
  _setUpViewModels();
  _setUpUseCases();
  _setUpRepositories();
  _setUpDataSources();
  _setUpExternalSources();
}

void _setUpViewModels() {
  getit.registerLazySingleton(() => FavoritesViewModel(
      getFavoriteActivitiesUseCase: getit(),
      deleteFavoriteActivityUseCase: getit()));

  getit.registerLazySingleton(() => HomeViewModel(
      getActivityByTypeUseCase: getit(),
      getRandomActivityUseCase: getit(),
      saveActivityAsFavoriteUseCase: getit(),
      deleteFavoriteActivityUseCase: getit()));
}

void _setUpUseCases() {
  getit.registerLazySingleton(
      () => GetRandomActivity(repositoryContract: getit()));

  getit.registerLazySingleton(
      () => GetActivityByType(repositoryContract: getit()));
  getit.registerLazySingleton(
      () => GetFavoriteActivities(repositoryContract: getit()));
  getit.registerLazySingleton(
      () => SaveActivityAsFavorite(repositoryContract: getit()));
  getit.registerLazySingleton(
      () => DeleteFavoriteActivity(repositoryContract: getit()));
}

void _setUpRepositories() {
  getit.registerLazySingleton<ActivityRepositoryContract>(() =>
      ActivityRepositoryImplementation(
          localDataSourceContract: getit(),
          remoteDataSourceContract: getit(),
          networkCheckerContract: getit(),
          exceptionHandler: getit()));
}

void _setUpDataSources() {
  getit.registerLazySingleton<ActivityLocalDataSourceContract>(
      () => ActivityLocalDataSourceImplementation());

  getit.registerLazySingleton<ActivityRemoteDataSourceContract>(
      () => ActivityRemoteDataSourceImplementation());

  getit.registerLazySingleton<NetworkCheckerContract>(
      () => NetworkCheckerImplementation(connectivity: getit()));

  getit.registerLazySingleton(() => ActivityExceptionHandler());
}

void _setUpExternalSources() {
  getit.registerLazySingleton(() => Connectivity());
}
