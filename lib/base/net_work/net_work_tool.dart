import 'dart:convert';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zhuchangduan/base/config/config_util.dart';
import 'package:zhuchangduan/base/tools/toast_util.dart';

class NetWorkUtil {
  NetWorkUtil(){
    initCookieManager();
  }

  static Dio _dio = new Dio();
  static Dio getDio()=>_dio;
  static Future getHttp(String url) async {
    EasyLoading.show(status: 'loading...');

    try {
      Response response = await getDio().get(ConfigUtil.baseUrl + url);
      print('请求数据:'+response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpParam(String path,  {Map<String, dynamic> data}) async {
    EasyLoading.show(status: 'loading...');
    data = data ?? {};
    data.forEach((key, value) {
      if (path.indexOf(key) != -1) {
        path = path.replaceAll(":$key", value.toString());
      }
    });

    try {
      Response response = await getDio().get(ConfigUtil.baseUrl + path);
      print('请求数据:'+response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpQuery(String url,Map<String,String> map) async {
    EasyLoading.show(status: 'loading...');

    try {
      Response response = await getDio().get(ConfigUtil.baseUrl+url, queryParameters: map);
      print('请求数据:'+response.toString());
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  static Future getHttpByUrl(String url) async {
    EasyLoading.show(status: 'loading...');
    try {
      print("获取城市:"+url);
      Response response = await Dio().get(url);
      EasyLoading.dismiss();
      print('请求数据:'+response.toString());
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }

  Future initCookieManager() async{
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj=new PersistCookieJar(ignoreExpires: true,
        storage: FileStorage(tempPath));
    _dio.interceptors.add(CookieManager(cj));
    print("初始化cookie");
  }

  static Future postHttp(String url,Map<String,dynamic> map,{loginPage = false}) async {
    EasyLoading.show(status: '加载中...');
    Options option = new Options();


    Map<String, String> headers = new Map<String, String>();
    headers["XX-DEVICE-TYPE"] = "resident";

    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    String token = sharedPreferences.get("token");

    if(token != null && token.length > 0){
      headers["XX-TOKEN"] = token;
    }

    option.headers = headers;
    try {
      FormData formData = FormData.fromMap(map);

      Response response = await getDio().post(ConfigUtil.baseUrl+url, data: formData,options: option);

      print('请求数据:'+response.toString());
      Map resultMap = json.decode(response.toString());
      EasyLoading.dismiss();
      if (resultMap["code"] == 10001) {
        print("============================="+loginPage.toString());
        if(!loginPage) {
          ToastUtil.showToast("用户未登录");
        }
        navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => (LoginPage())),(check) => false);
        return;
      }
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
    }
  }
}