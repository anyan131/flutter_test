// ignore: avoid_web_libraries_in_flutter

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'home_page.dart';

void main() {
  runApp(LinearLayoutApp());
}

class LinearLayoutApp extends StatefulWidget {
  @override
  State createState() {
    return _LinearLayoutAppState();
  }
}

class _LinearLayoutAppState extends State<LinearLayoutApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(title: 'Container Demo', home: SignInRoute()));
  }
}

class SignInRoute extends StatelessWidget {
  // ignore: must_be_immutable
  var _username = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Login')),
      //点击空白、TextField 失去焦点
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Container(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        radius: 10.0,
                        backgroundImage: AssetImage("images/image_splash.JPG"),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 15.0, top: 5.0, right: 5.0, bottom: 5.0),
                        labelText: 'Username',
                      ),
                      onChanged: (value) {
                        print("TextField 中输入的内容 $value");
                        _username = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      autofocus: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 15.0, top: 5.0, right: 5.0, bottom: 5.0),
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        _password = value;
                      },
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        showToast(
                          "登录",
                          duration: Duration(seconds: 2),
                          position: ToastPosition.bottom,
                          backgroundColor: Colors.blue.withOpacity(0.8),
                          radius: 13.0,
                          textStyle: TextStyle(fontSize: 18.0),
                        );
                        print('用户名 $_username' + " \n密码 $_password");

                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext ctx) {
                          return new Home_Page();
                        }));
                      },
                      child: Container(
                        width: 320.0,
                        height: 60.0,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Text(
                          " SignIn",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
      resizeToAvoidBottomPadding: false,
    );
  }
}
