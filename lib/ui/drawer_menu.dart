
import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Safa Uludoğan'),
            accountEmail: const Text('suludogan1@gmail.com'),
            currentAccountPicture: Image.network(
                "https://pbs.twimg.com/profile_images/955579664008908801/07Alu7I8_400x400.jpg"),
            otherAccountsPictures: const [
              CircleAvatar(
                  backgroundColor: Colors.purple, child: Text('AU')),
              CircleAvatar(backgroundColor: Colors.grey, child: Text('SU')),
            ],
          ),
          Expanded(
            child: ListView(
              children:[
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Anasayfa'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Ara'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Hesap'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(),
                InkWell(//Tıklama efekti yapan sınıf
                    onTap: (){

                    },
                    splashColor: Colors.cyan,//Tıklama rengi
                    child: const ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Anasayfa'),
                      trailing: Icon(Icons.chevron_right),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
