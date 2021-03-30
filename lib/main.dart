import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/net_work/net_work_tool.dart';
import 'login_register_page/page/login_page.dart';

void main() {
  setCustomErrorPage();
  runApp(HfhcZcApp());
}

void setCustomErrorPage() {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    print(flutterErrorDetails.toString());
    return Center(
      child: Text("请重新加载"),
    );
  };
}

class HfhcZcApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HfhcZcAppState();
  }
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class HfhcZcAppState extends State<HfhcZcApp> {
  static BuildContext appContext;
  var resultData;
  static bool logged = false;
  static GlobalKey<NavigatorState> navigatorState = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resultData = getData();
  }

  Future getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    String user_id = sharedPreferences.get("userId");
    print(
        "================$token==================$user_id===========================");
    if (token == null || user_id == null) {
      logged = false;
      return;
    }
    Map<String, dynamic> postMap = new Map<String, dynamic>();
    postMap['user_id'] = user_id;
    var result = await NetWorkUtil.postHttp(
        "/api/residentapp/todayVisit/benrisuliang", postMap,
        loginPage: true);
    Map resultMap = json.decode(result.toString());
    int code = resultMap['code'];
    if (code == 0) {
      logged = true;
      return false;
    }
    logged = false;
    return;
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;

    return FlutterEasyLoading(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: '好房好车驻场',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                print('waiting');
                return Center(child: CupertinoActivityIndicator());
              case ConnectionState.done:
                print('done');
//                if (snapshot.hasError) {
//                  return Center(
//                    child: Text('网络请求出错'),
//                  );
//                }
                if (!logged) {
                  return LoginPage();
                }
                return BaseTabBar();
            }
            return null;
          },
          future: resultData,
        ),
      ),
    );
  }
}