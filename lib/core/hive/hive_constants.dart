class HiveConstants {
  HiveConstants._();

  static final HiveConstants _HiveConstantsInstance = HiveConstants._();

  factory HiveConstants() {
    return _HiveConstantsInstance;
 }

  String CACHE_BOX = "cache";
  String FAVORITES_BOX = "favorites";
  String CACHED_ITEM = "cached_item";
}