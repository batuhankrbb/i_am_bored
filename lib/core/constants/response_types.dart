import '../../features/activities/data/models/activity_model.dart';

class DefaultResponseTypes {
  DefaultResponseTypes._();

  static final DefaultResponseTypes _DefaultResponseTypesInstance = DefaultResponseTypes._();

  factory DefaultResponseTypes() {
    return _DefaultResponseTypesInstance;
 }

 ActivityModel DEFAULT_ACTIVITY_MODEL = ActivityModel(
    activity: "",
    type: "",
    participants: 0,
    price: 0,
    link: "",
    key: "",
    accessibility: 0);
}