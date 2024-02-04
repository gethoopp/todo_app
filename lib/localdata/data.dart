// ignore: depend_on_referenced_packages
import 'package:isar/isar.dart';

part 'data.g.dart';

@Collection()
class Data {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? task;
  String? description;
  String? date;
}

