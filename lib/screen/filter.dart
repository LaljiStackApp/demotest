import 'package:flutter/material.dart';

import '../model/filter_model.dart';
class FiltersData extends StatefulWidget {
  const FiltersData({super.key});

  @override
  State<FiltersData> createState() => _FiltersDataState();
}

class _FiltersDataState extends State<FiltersData> {
  String dropdownvalue='all';
  List<String> items=['all','one','two','three'];
  Map<String,List<FilterModel>> data={
    'one':[FilterModel(data: 'one 1'),FilterModel(data: 'one 1'),FilterModel(data: 'one 2'),FilterModel(data: 'one 3'),FilterModel(data: 'one 4'),FilterModel(data: 'one 5'),],
    'two':[FilterModel(data: 'two 1'),FilterModel(data: 'two 1'),FilterModel(data: 'two 2'),FilterModel(data: 'two 3'),FilterModel(data: 'two 4'),FilterModel(data: 'two 5'),],
    'three':[FilterModel(data: 'three 1'),FilterModel(data: 'three 1'),FilterModel(data: 'three 2'),FilterModel(data: 'three 3'),FilterModel(data: 'three 4'),FilterModel(data: 'three 5'),],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
         Container(
                  height: 20,
                  child: DropdownButton(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {

                        dropdownvalue = newValue!;
                      setState(() {

                      });
                    },
                  ),

              )



        ],
      ),
      body: Column(
        children: [
          const Text(''),
          Expanded(child: ListView.builder(
            itemCount: dropdownvalue=='all'?15:data[dropdownvalue]!.length,
            itemBuilder: (context,index){
              return dropdownvalue=='all'? ListTile(
                title: Text("Hello"),
              ):ListTile(
                title: Text(data[dropdownvalue]![index].data),
              );
            },

          )),
        ],
      ),
    );
  }
}
