// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:zhuchangduan/login_register_page/model/login_model_entity.dart';
import 'package:zhuchangduan/generated/json/login_model_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case LoginModelEntity:
				return loginModelEntityFromJson(data as LoginModelEntity, json) as T;
			case LoginModelData:
				return loginModelDataFromJson(data as LoginModelData, json) as T;
			case LoginModelDataUserInfo:
				return loginModelDataUserInfoFromJson(data as LoginModelDataUserInfo, json) as T;
			case LoginModelDataCompany:
				return loginModelDataCompanyFromJson(data as LoginModelDataCompany, json) as T;
			case LoginModelDataIm:
				return loginModelDataImFromJson(data as LoginModelDataIm, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case LoginModelEntity:
				return loginModelEntityToJson(data as LoginModelEntity);
			case LoginModelData:
				return loginModelDataToJson(data as LoginModelData);
			case LoginModelDataUserInfo:
				return loginModelDataUserInfoToJson(data as LoginModelDataUserInfo);
			case LoginModelDataCompany:
				return loginModelDataCompanyToJson(data as LoginModelDataCompany);
			case LoginModelDataIm:
				return loginModelDataImToJson(data as LoginModelDataIm);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (LoginModelEntity).toString()){
			return LoginModelEntity().fromJson(json);
		}	else if(type == (LoginModelData).toString()){
			return LoginModelData().fromJson(json);
		}	else if(type == (LoginModelDataUserInfo).toString()){
			return LoginModelDataUserInfo().fromJson(json);
		}	else if(type == (LoginModelDataCompany).toString()){
			return LoginModelDataCompany().fromJson(json);
		}	else if(type == (LoginModelDataIm).toString()){
			return LoginModelDataIm().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<LoginModelEntity>[] is M){
			return data.map<LoginModelEntity>((e) => LoginModelEntity().fromJson(e)).toList() as M;
		}	else if(<LoginModelData>[] is M){
			return data.map<LoginModelData>((e) => LoginModelData().fromJson(e)).toList() as M;
		}	else if(<LoginModelDataUserInfo>[] is M){
			return data.map<LoginModelDataUserInfo>((e) => LoginModelDataUserInfo().fromJson(e)).toList() as M;
		}	else if(<LoginModelDataCompany>[] is M){
			return data.map<LoginModelDataCompany>((e) => LoginModelDataCompany().fromJson(e)).toList() as M;
		}	else if(<LoginModelDataIm>[] is M){
			return data.map<LoginModelDataIm>((e) => LoginModelDataIm().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}