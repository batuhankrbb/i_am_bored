import 'package:im_bored_app/core/network_clients/activity_client.dart';

enum ActivityType {
  education,
  recreational,
  social,
  diy,
  charity,
  cooking,
  relaxation,
  music,
  busywork
}

extension RawValue on ActivityType {
  String get rawValue {
    switch (this) {
      case ActivityType.education:
        return "education";
      case ActivityType.recreational:
        return "recreational";
      case ActivityType.social:
        return "social";
      case ActivityType.diy:
        return "diy";
      case ActivityType.education:
        return "education";
      case ActivityType.charity:
        return "charity";
      case ActivityType.cooking:
        return "cooking";
      case ActivityType.relaxation:
        return "relaxation";
      case ActivityType.music:
        return "mudic";
      case ActivityType.busywork:
        return "busywork";
      default:
        return "education";
    }
  }
}
