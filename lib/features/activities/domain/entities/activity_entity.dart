import '../../data/models/activity_model.dart';

class ActivityEntity {
  final String activity;
  final String type;
  final String price;
  final double accessibility;

  ActivityModel model;

  ActivityEntity(
      {required this.activity,
      required this.type,
      required this.price,
      required this.accessibility,
      required this.model});
}
