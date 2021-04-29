import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//? yapmak istediklerimiz
//
//* Create, Read, Update, Delete. Ama
//*  Ayıracağımız sınıflar
//* - Hive'in GUI si gibi yani client mantığı gibi bir sınıf yapıcaz. BoxName alıcak içinde dümdüz updatebox, closebox, getbox, openbox gibi şeyler olacak.
//* -
//
class HiveHelper {
  Future<Box<dynamic>> openBox({required String boxName}) {
    return Hive.openBox(boxName);
  }

  Box<dynamic> getBox({required String boxName}) {
    return Hive.box(boxName);
  }

  Future<int> addValue(
      {required String boxName, required dynamic objectToAdd}) {
    var box = Hive.box(boxName);
    return box.add(objectToAdd);
  }

  Future<void> replaceValue(
      {required String boxName,
      required dynamic objectToPut,
      required dynamic key}) {
    var box = Hive.box(boxName);
    return box.put(key, objectToPut);
  }

  Future<void> deleteValue({required String boxName, required dynamic key}) {
    var box = Hive.box(boxName);
    return box.delete(key);
  }

  
}
