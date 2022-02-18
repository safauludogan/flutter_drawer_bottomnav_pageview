import 'package:flutter/material.dart';

import '../models/data.dart';

class HomePage extends StatefulWidget {
  const HomePage(Key key) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Data> allDatas;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allDatas = [
      Data("Biz kimiz","Biz kimiz'in içeriği buraya gelecek",false),
      Data("Biz neredeyiz","Biz neredeyiz'in içeriği buraya gelecek",false),
      Data("Misyonumuz","Misyonumuz'un içeriği buraya gelecek",false),
      Data("Vizyonumuz","Vizyonumuz'un içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
      Data("İletişim","Biz kimiz'in içeriği buraya gelecek",false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ExpansionTile(
        key: PageStorageKey("$index"),
        title: Text(allDatas[index].header),
        initiallyExpanded: allDatas[index].expanded,
        children: [
          Container(
            color:
                index % 2 == 0 ? Colors.red.shade200 : Colors.yellow.shade300,
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(allDatas[index].content),
            ),
          )
        ],
      );
    },itemCount: allDatas.length,);
  }
}
