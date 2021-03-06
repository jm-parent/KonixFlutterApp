import 'dart:async';
import 'package:flutter/material.dart';
import 'package:konixflutter/fragments/NewsPage.dart';
import 'package:konixflutter/fragments/TeamsPage.dart';
import 'package:konixflutter/fragments/RecruitementPage.dart';
import 'package:konixflutter/fragments/ContactPage.dart';
import 'package:konixflutter/fragments/PressPage.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("News", Icons.rss_feed),
    new DrawerItem("Nos Equipes", Icons.face),
    new DrawerItem("Recrutement", Icons.info),
    new DrawerItem("Press", Icons.developer_board),
    new DrawerItem("Contact", Icons.phone),
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
          return new NewsWidget();
      case 1:
        return new TeamsWidget();
      case 2:
        return new RecruitementWidget();
      case 3:
        return new PressWidget();
      case 4:
        return new ContactWidget();
      default:
        return new Text("Error");
    }
  }
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new WillPopScope(
        onWillPop: _onWillPop,
        child:  new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    ));
  }
}