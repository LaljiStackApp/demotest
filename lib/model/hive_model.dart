import 'package:hive/hive.dart';
part 'hive_model.g.dart';
@HiveType(typeId: 0)
class HiveModel extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String profession;
  HiveModel({required this.name,required this.profession});
}