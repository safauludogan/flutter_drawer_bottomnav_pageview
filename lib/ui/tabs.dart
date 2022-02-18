import 'package:flutter/material.dart';

class TabExample extends StatefulWidget {
  const TabExample({Key? key}) : super(key: key);

  @override
  _TabExampleState createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab kullanımı'),
        bottom: myTab(),
      ),
      bottomNavigationBar: myTabBottom(),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.redAccent,
            child: const Center(
              child: Text(
                "Birinci sayfa",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Container(
            color: Colors.blueAccent,
            child: const Center(
              child: Text(
                "İkinci sayfa",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: const Center(
              child: Text(
                "Üçüncü sayfa",
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBar myTab() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(icon: Icon(Icons.keyboard), text: 'Tab 1'),
        Tab(icon: Icon(Icons.lock), text: 'Tab 2'),
        Tab(icon: Icon(Icons.add_box), text: 'Tab 3'),
      ],
    );
  }

  Widget myTabBottom() {
    return Container(
      color: Colors.tealAccent,
      child: TabBar(
        controller: tabController,
        tabs: const [
          Tab(icon: Icon(Icons.keyboard), text: 'Tab 1'),
          Tab(icon: Icon(Icons.lock), text: 'Tab 2'),
          Tab(icon: Icon(Icons.add_box), text: 'Tab 3'),
        ],
      ),
    );
  }
}
