import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhuchangduan/base/net_work/net_work_tool.dart';
import 'package:zhuchangduan/base/tools/colors_util.dart';
import 'package:zhuchangduan/base/tools/toast_util.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin {
  var username = new TextEditingController();
  var password = new TextEditingController();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        allowFontScaling: false,
        orientation: Orientation.portrait);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(0),
                        top: ScreenUtil().setWidth(270)),
//              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(120), 0, ScreenUtil().setWidth(20), ScreenUtil().setWidth(10)),
                    child: Image.asset(
                      "images/2.0x/hfhcTitleLogo.png",
                      width: ScreenUtil().setWidth(228),
                      height: ScreenUtil().setWidth(54),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(28),
                        top: ScreenUtil().setWidth(260)),
//              padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(120), 0, ScreenUtil().setWidth(20), ScreenUtil().setWidth(10)),
                    child: Image.asset(
                      "images/3.0x/img_zhuchang@3x.png",
                      width: ScreenUtil().setWidth(120),
                      height: ScreenUtil().setWidth(48),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(0),
                    top: ScreenUtil().setWidth(30)),
                alignment: Alignment.center,
//              width: ScreenUtil().setSp(25)*4.1,
                child: Text(
                  "??????????????????",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(48),
                      fontWeight: FontWeight.bold,
                      color: ColorsUtil.hexColor(0x2F2F2F)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setWidth(100),
                    left: ScreenUtil().setWidth(80),
                    right: ScreenUtil().setWidth(80)),

                height: ScreenUtil().setWidth(90),
//              width: ScreenUtil().setWidth(520),
                child: TextField(
                  controller: username,
                  cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                  //????????????
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
//                    border: InputBorder.none,
                      hintText: "?????????????????????",
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsUtil.hexColor(0xEA5413)),
                      ),
                      hintStyle: new TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.normal,
                          color: ColorsUtil.hexColor(0x9F9F9F))),
//                  maxLength: 30,//?????????????????????????????????TextField????????????????????????????????????????????????
                  maxLines: 1,
                  //????????????
//                  autocorrect: true,//??????????????????
                  autofocus: true,
                  //??????????????????
//                  obscureText: true,//???????????????
//                  textAlign: TextAlign.center,//??????????????????
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.normal,
                      color: ColorsUtil.hexColor(0x2F2F2F)),
                  //?????????????????????
                  onChanged: (text) {
                    //?????????????????????
                    print('change $text');
                  },
                  onSubmitted: (text) {
                    //????????????(?????????)?????????
                    print('submit $text');
                  },
//                  enabled: true,//????????????
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil().setWidth(10),
                    left: ScreenUtil().setWidth(80),
                    right: ScreenUtil().setWidth(80)),

                height: ScreenUtil().setWidth(90),
//              width: ScreenUtil().setWidth(520),
                child: TextField(
                  controller: password,
                  cursorColor: ColorsUtil.hexColor(0x9F9F9F),
                  //????????????
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 9.8),
//                    border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorsUtil.hexColor(0xEA5413)),
                      ),
                      hintText: "???????????????",
                      hintStyle: new TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.normal,
                          color: ColorsUtil.hexColor(0x9F9F9F))),
//                  maxLength: 30,//?????????????????????????????????TextField????????????????????????????????????????????????
                  maxLines: 1,
                  //????????????
//                  autocorrect: true,//??????????????????
                  autofocus: true,
                  //??????????????????
                  obscureText: true,
                  //???????????????
//                  textAlign: TextAlign.center,//??????????????????
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.normal,
                      color: ColorsUtil.hexColor(0x2F2F2F)),
                  //?????????????????????
                  onChanged: (text) {
                    //?????????????????????
                    print('change $text');
                  },
                  onSubmitted: (text) {
                    //????????????(?????????)?????????
                    print('submit $text');
                  },
//                  enabled: true,//????????????
                ),
              ),
              Container(
//              margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
                margin: EdgeInsets.only(
                    top: ScreenUtil().setWidth(80),
                    left: ScreenUtil().setWidth(80),
                    right: ScreenUtil().setWidth(80)),

                width: ScreenUtil().setWidth(600),
                height: ScreenUtil().setWidth(80),
                child: FlatButton(
                  onPressed: () {
                    if (username.text.length == 0) {
                      ToastUtil.showToast("?????????????????????", b: true);
                      return;
                    } else if (username.text.length > 11 ||
                        username.text.length < 11) {
                      ToastUtil.showToast("??????????????????????????????", b: true);
                      return;
                    }

                    if (password.text.length == 0) {
                      ToastUtil.showToast("???????????????", b: true);
                      return;
                    } else if (password.text.length > 6 ||
                        username.text.length > 18) {
                      ToastUtil.showToast("?????????6-18?????????", b: true);
                      return;
                    }

                    Map<String, dynamic> postMap = new Map<String, dynamic>();
                    postMap['username'] = username.text;
                    postMap['password'] = password.text;

                    NetWorkUtil.postHttp("/api/Residentapp/user/login", postMap)
                        .then((result) async {
                      Map resultMap = json.decode(result.toString());
                      var resultDic = new LoginModel().fromJson(resultMap);
                      if (resultDic.code != 0) {
                        ToastUtil.showToast(resultDic.msg, b: true);
                        return;
                      }
                      SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      print("??????map??????" + resultMap.toString());
                      List list = resultMap["data"]["zc_fangyuan"];
                      if (resultDic.code == 0 && list.length != null) {
                        sharedPreferences.setString(
                            "token", resultDic.data.token);
                        print("token: " + resultDic.data.token);
                        sharedPreferences.setString(
                            "userId", resultDic.data.userInfo.id);
                        sharedPreferences.setString(
                            "nickName", resultDic.data.userInfo.nickname);
                        sharedPreferences.setString(
                            "avatar", resultDic.data.userInfo.avatar);
                        sharedPreferences.setString(
                            "sex", resultDic.data.userInfo.sex);
                        sharedPreferences.setString(
                            "phone", resultDic.data.userInfo.phone);
                        sharedPreferences.setString(
                            "area_name", resultDic.data.company.areaName);

                        // toRegisterDeviceToken(resultDic.data.userInfo.id);
                        Map<String, String> user = new Map<String, String>();
                        user["user_id"] = resultDic.data.im.userId;
                        user["user_sign"] = resultDic.data.im.userSign;
                        user["nick_name"] = resultDic.data.userInfo.nickname;
                        user["avatar"] = resultDic.data.userInfo.avatar;
                        // toLoginIm(user);
                        Navigator.of(context).pushAndRemoveUntil(
                            new MaterialPageRoute(
                                // builder: (context) => BaseTabBar()
                              builder: (context) => null
                            ),
                            (route) => route == null);
                      } else {
                        if (list.length == 0) {
                          ToastUtil.showToast("?????????????????????????????????????????????", b: true);
                        } else {
                          ToastUtil.showToast(resultDic.msg, b: true);
                        }
                      }

                      setState(() {
//                      homeBannerList = imageList;
                      });
                    });
                  },
                  child: Text("??????",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(30),
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  color: ColorsUtil.hexColor(0xEA5413),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ]),
      ),
    );
  }
}
