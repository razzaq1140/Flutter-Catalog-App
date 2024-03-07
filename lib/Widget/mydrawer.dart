import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              accountName: Text('Abdul Razzaq'),
              accountEmail: Text('abdulrazzaq1140@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assests/animal.jpg'),
                // backgroundImage: NetworkImage('https://adminapi.applegadgetsbd.com/storage/media/large/1533-48820.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,color: Colors.black,),
            title: Text('Home',textScaleFactor: 1.2,),

          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail,color: Colors.black,),
            title: Text('Email',textScaleFactor: 1.2,),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled,color: Colors.black,),
            title: Text('Profile',textScaleFactor: 1.2,),

          ),
        ],
      ),
    );
  }
}
