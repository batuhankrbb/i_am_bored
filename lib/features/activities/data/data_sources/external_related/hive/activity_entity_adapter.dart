import 'package:hive/hive.dart';

import '../../../../domain/entities/activity_entity.dart';

part 'activity_entity_adapter.g.dart';

@HiveType(typeId: 1)
class ActivityEntityHive {
  @HiveField(0)
  late String activity;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late num accessibility;

  @HiveField(3)
  late String key;

  @HiveField(4)
  late num price;

  @HiveField(5)
  late int participants;

  ActivityEntityHive(
      {required this.activity,
      required this.type,
      required this.accessibility,
      required this.key,
      required this.price,
      required this.participants});

  ActivityEntityHive.fromEntity(ActivityEntity entity) {
    this.activity = entity.activity;
    this.type = entity.type;
    this.accessibility = entity.accessibility;
    this.key = entity.key;
    this.price = entity.price;
    this.participants = entity.participants;
  }

  ActivityEntity toEntity() {
    return ActivityEntity(
        activity: activity,
        accessibility: accessibility,
        type: type,
        key: key,
        price: price,
        participants: participants);
  }
}
