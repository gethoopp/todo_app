import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  Id id = Isar.autoIncrement;

  String? icons;
}
