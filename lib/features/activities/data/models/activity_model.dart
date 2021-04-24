import 'package:im_bored_app/core/network/base_network_model.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';

class ActivityModel extends BaseNetworkModel<ActivityModel> {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;

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
    var convertedPrice = "$price";
    return ActivityEntity(
        activity: activity,
        type: type,
        price: convertedPrice,
        accessibility: accessibility,
        model: this);
  }

}


//! sorun -> save ederken model olarak save etmek istiyorum.