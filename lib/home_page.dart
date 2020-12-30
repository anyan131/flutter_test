import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oktoast/oktoast.dart';

class Home_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  int position = 0;
  var _dataTab;
  var _dataIcon;
  var _dataPage;

  void _initTab(){
    _dataTab = ["首页","发现","我的"];
    _dataIcon = [new Icon(Icons.home),new Icon(Icons.search),new Icon(Icons.person)];

  }

  @override
  Widget build(BuildContext context) {

    // _initTab();


    return OKToast(
      child: MaterialApp(
        title: "Home Page",
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: new Text('Home Page'),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // actions: <Widget>[
            //   new IconButton(
            //       icon: new Icon(Icons.add),
            //       tooltip: 'Add Alarm',
            //       onPressed: () {}),
            // ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("首页")),
              new BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text("我的"))
            ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            iconSize: 24.0,

          ),
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
      ),
    );
  }

  Image getIcon(int index) {
    String select = index == position ? _dataIcon[1] : _dataIcon[0];
    return new Image.asset(select,width: 20,height: 20);
  }

  Text getText(int index) {
    Color textColor = index == position ? new Color(0xff1296db): Colors.black87;
    return new Text(_dataTab[index],style: new TextStyle(fontSize: 12,color: textColor));
  }
}
