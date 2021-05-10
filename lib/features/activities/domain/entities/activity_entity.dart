import '../../../../core/utils/number_helper.dart';

class ActivityEntity {
  final String activity;
  final String type;
  final num price;
  final num accessibility;
  final String key;
  final int participants;

  ActivityEntity(
      {required this.activity,
      required this.type,
      required this.price,
      required this.accessibility,
      required this.key,
      required this.participants});

  String get personText {
    var personText = participants == 1 ? "person" : "people";
    return "you need +$participants $personText to do it";
  }

  String get typeText {
    return "The type of this activity is $type";
  }

  String get expensiveText {
    var formattedPrice = NumberHelper().fixDouble(price * 100, 2);
    return "This activity is %$formattedPrice more expensive than others";
  }
}
