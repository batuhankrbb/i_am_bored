import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../features/activities/presentation/sections/favorites/pages/favorite_activities_page/favorite_activities_page.dart';
import '../../../features/activities/presentation/sections/favorites/pages/favorites_detail_page/favorites_detail_page.dart';
import '../../../features/activities/presentation/sections/home/pages/activity_detail_page/activity_detail_page.dart';
import '../../../features/activities/presentation/sections/home/pages/choose_type_page/choose_type_page.dart';
import '../../../features/activities/presentation/sections/home/pages/home_page/home_page.dart';
import '../../../features/activities/presentation/sections/home/pages/im_not_page/im_not_page.dart';

part 'navigation_routes.freezed.dart';

@freezed
class NavigationRoute with _$NavigationRoute {
  const factory NavigationRoute.chooseTypePage(ChooseTypePage chooseTypePage) =
      FChooseTypePage;
  const factory NavigationRoute.iAmNotBoredPage(
      IAmNotBoredPage iAmNotBoredPage) = FIAmNotBoredPage;
  const factory NavigationRoute.homePage(HomePage homePage) = FHomePage;
  const factory NavigationRoute.activityDetailPage(
      ActivityDetailPage activityDetailPage) = FActivityDetailPage;
  const factory NavigationRoute.favoriteDetailPage(
          ActivityFavoriteDetailPage activityFavoriteDetailPage) =
      FFavoriteDetailPage;
  const factory NavigationRoute.favoritesPage(
      FavoriteActivitiesPage favoriteActivitiesPage) = FFavoritesPage;
}

extension MultiNavigation on NavigationRoute {
  String get rawValue {
    return this.when(
        homePage: (_) => "/",
        chooseTypePage: (_) => "/chooseTypePage",
        iAmNotBoredPage: (_) => "/iAmNotBoredPage",
        activityDetailPage: (_) => "/activityDetailPage",
        favoriteDetailPage: (_) => "/favoriteDetailPage",
        favoritesPage: (_) => "/favoritesPage");
  }
}
