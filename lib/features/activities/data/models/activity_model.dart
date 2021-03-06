import '../../../../core/network/network_fetching/base_network_model.dart';
import '../../domain/entities/activity_entity.dart';

class ActivityModel extends BaseNetworkModel<ActivityModel> {
  final String activity;
  final String type;
  final int participants;
  final num price;
  final String link;
  final String key;
  final num accessibility;

  ActivityModel(
      {required this.activity,
      required this.type,
      required this.participants,
      required this.price,
      required this.link,
      required this.key,
      required this.accessibility});

  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  @override
  ActivityModel fromJson(Map<String, dynamic> json) {
    return ActivityModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"]);
  }

  ActivityEntity toEntity() {
    return ActivityEntity(
        activity: activity,
        type: type,
        price: price,
        accessibility: accessibility,
        key: key,
        participants: participants);
  }

  @override
  String toString() {
    return "activity: $activity type: $type participants: $participants price: $price link: $link key: $key accessibility: $accessibility";
  }
}
