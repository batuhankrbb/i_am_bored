import 'package:im_bored_app/core/network/network_option_generator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_client.freezed.dart';

@freezed
abstract class ActivityClient extends NetworkOptionsGenerator
    with _$ActivityClient {
  const ActivityClient._() : super();
  const factory ActivityClient.activityRandom() = ActivityRandom;
  factory ActivityClient.activityByType(String type) = ActivityByType;

  @override
  String get baseURL => "https://www.boredapi.com";

  @override
  String get networkPath => this.when(
      activityRandom: () => "/api/activity/",
      activityByType: (_) => "/api/activity");

  @override
  String get networkMethod =>
      this.when(activityRandom: () => "GET", activityByType: (_) => "GET");


  @override
  Map<String, dynamic>? get queryParameters => this.when(activityRandom: () => null, activityByType: (type) => {"type":type});

  @override
  Map<String, dynamic>? get header => null;
}
