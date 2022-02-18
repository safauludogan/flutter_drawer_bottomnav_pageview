import 'package:drawer_bottomnav_pageview_etc/ui/drawer_menu.dart';
import 'package:drawer_bottomnav_pageview_etc/ui/home_page.dart';
import 'package:drawer_bottomnav_pageview_etc/ui/page_view.dart';
import 'package:drawer_bottomnav_pageview_etc/ui/search.dart';
import 'package:drawer_bottomnav_pageview_etc/ui/tabs.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        ThemeData(fontFamily: 'Genel', primarySwatch: Colors.teal);

    return MaterialApp(
      theme: theme.copyWith(
          colorScheme:
              theme.colorScheme.copyWith(secondary: Colors.orangeAccent)),
      title: 'Flutter dersleri 2',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedMenuItem = 0;
  late List<Widget> allPages;
  late HomePage homePage;
  late SearchPage searchPage;
  late PageViewExample viewPage;

  //Sayfalar arası geçişti, sayfaların kendi biçimini koruması için oluşturuyoruz(UI state koruma)
  var keyHomePage = const PageStorageKey("key_home_page");
  var keySearchPage = const PageStorageKey("key_search_page");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage(keyHomePage);
    searchPage = SearchPage(keySearchPage);
    viewPage = const PageViewExample();
    allPages = [homePage, searchPage, viewPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text('Flutter dersleri 2'),
      ),
      body: selectedMenuItem <= allPages.length - 1
          ? allPages[selectedMenuItem]
          : allPages[0],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      //Sadece bottomNavigation için tema oluşturduk
      data: ThemeData(
        canvasColor: Colors.cyan.shade100,
        primarySwatch: Colors.orange,
      ),
      child: BottomNavigationBar(
        items: const [
          //4 ve fazlası menü itemları olursa bottom shifting moduna giriyor. Bu yüzden " type: BottomNavigationBarType.fixed" bunu eklememiş gerekiyor
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              //activeIcon: Icon(Icons.call),//Aktif olduğunda gelecek olan icon
              label: 'Anasayfa',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Arama',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Ekle',
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Profil',
              backgroundColor: Colors.brown),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedMenuItem,
        onTap: (index) {
          setState(() {
            selectedMenuItem = index;
            if (index == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const TabExample()))
                  .then((value) {
                selectedMenuItem = 0;
              });
            }
          });
        },
      ),
    );
  }
}
