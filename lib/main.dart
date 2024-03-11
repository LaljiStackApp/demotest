import 'package:demo/model/hive_model.dart';
import 'package:demo/screen/service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  print('hello');
  WidgetsFlutterBinding.ensureInitialized();

  var directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveModelAdapter());
  Hive.openBox<HiveModel>('trial');
  runApp(const MaterialApp(
    home: HiveDemo(),
  ));
}

class HiveDemo extends StatefulWidget {
  const HiveDemo({super.key});

  @override
  State<HiveDemo> createState() => _HiveDemoState();
}

class _HiveDemoState extends State<HiveDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ValueListenableBuilder<Box<HiveModel>>(
        valueListenable: HiveDemoData.getBox().listenable(),
              builder: (context,boxes,_){
          var data=boxes.values.toList().cast<HiveModel>();

          return ListView.builder(itemCount: boxes.length,itemBuilder: (context,index){
            print('length of this is ${boxes.length}');
                return Card(
                  child: Column(
                    children: [
                      Text(data[index].name),
                      IconButton(onPressed: (){
                        data[index].delete();
                      }, icon: Icon(Icons.delete)),
                      Text(data[index].key.toString()),
                    ],
                  ),
                );
              });
               },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          final box=HiveDemoData.getBox();
         HiveModel hiveModel= HiveModel(name: 'hem', profession: 'Extreme Developer');


          box.add(hiveModel);
          print('hivemodel key ${hiveModel.key}');

          hiveModel.save();




        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
