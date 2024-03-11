import 'package:hive/hive.dart';

import '../model/hive_model.dart';

class HiveDemoData{
  static Box<HiveModel> getBox()=>Hive.box<HiveModel>('trial');
}