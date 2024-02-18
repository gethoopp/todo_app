// ignore: depend_on_referenced_packages
import 'package:isar/isar.dart';

part 'cat.g.dart';

@Collection()
class Category {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? icons;
}
