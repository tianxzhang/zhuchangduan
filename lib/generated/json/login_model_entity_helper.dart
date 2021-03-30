import 'package:zhuchangduan/login_register_page/model/login_model_entity.dart';

loginModelEntityFromJson(LoginModelEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'] is String
				? int.tryParse(json['code'])
				: json['code'].toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = LoginModelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> loginModelEntityToJson(LoginModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

loginModelDataFromJson(LoginModelData data, Map<String, dynamic> json) {
	if (json['token'] != null) {
		data.token = json['token'].toString();
	}
	if (json['user_info'] != null) {
		data.userInfo = LoginModelDataUserInfo().fromJson(json['user_info']);
	}
	if (json['company'] != null) {
		data.company = LoginModelDataCompany().fromJson(json['company']);
	}
	if (json['im'] != null) {
		data.im = LoginModelDataIm().fromJson(json['im']);
	}
	if (json['zc_fangyuan'] != null) {
		data.zcFangyuan = (json['zc_fangyuan'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['zc_message'] != null) {
		data.zcMessage = json['zc_message'].toString();
	}
	return data;
}

Map<String, dynamic> loginModelDataToJson(LoginModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['token'] = entity.token;
	data['user_info'] = entity.userInfo?.toJson();
	data['company'] = entity.company?.toJson();
	data['im'] = entity.im?.toJson();
	data['zc_fangyuan'] = entity.zcFangyuan;
	data['zc_message'] = entity.zcMessage;
	return data;
}

loginModelDataUserInfoFromJson(LoginModelDataUserInfo data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['username'] != null) {
		data.username = json['username'].toString();
	}
	if (json['nickname'] != null) {
		data.nickname = json['nickname'].toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar'];
	}
	if (json['sex'] != null) {
		data.sex = json['sex'].toString();
	}
	if (json['idPhoto'] != null) {
		data.idPhoto = json['idPhoto'];
	}
	if (json['phone'] != null) {
		data.phone = json['phone'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['area_id'] != null) {
		data.areaId = json['area_id'].toString();
	}
	if (json['bumen'] != null) {
		data.bumen = json['bumen'].toString();
	}
	return data;
}

Map<String, dynamic> loginModelDataUserInfoToJson(LoginModelDataUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['nickname'] = entity.nickname;
	data['avatar'] = entity.avatar;
	data['sex'] = entity.sex;
	data['idPhoto'] = entity.idPhoto;
	data['phone'] = entity.phone;
	data['status'] = entity.status;
	data['area_id'] = entity.areaId;
	data['bumen'] = entity.bumen;
	return data;
}

loginModelDataCompanyFromJson(LoginModelDataCompany data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['area_name'] != null) {
		data.areaName = json['area_name'].toString();
	}
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['area_status'] != null) {
		data.areaStatus = json['area_status'].toString();
	}
	if (json['add_time'] != null) {
		data.addTime = json['add_time'].toString();
	}
	if (json['update_time'] != null) {
		data.updateTime = json['update_time'].toString();
	}
	if (json['admin_id'] != null) {
		data.adminId = json['admin_id'].toString();
	}
	if (json['remarks'] != null) {
		data.remarks = json['remarks'].toString();
	}
	return data;
}

Map<String, dynamic> loginModelDataCompanyToJson(LoginModelDataCompany entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['area_name'] = entity.areaName;
	data['address'] = entity.address;
	data['area_status'] = entity.areaStatus;
	data['add_time'] = entity.addTime;
	data['update_time'] = entity.updateTime;
	data['admin_id'] = entity.adminId;
	data['remarks'] = entity.remarks;
	return data;
}

loginModelDataImFromJson(LoginModelDataIm data, Map<String, dynamic> json) {
	if (json['role'] != null) {
		data.role = json['role'].toString();
	}
	if (json['user_id'] != null) {
		data.userId = json['user_id'].toString();
	}
	if (json['user_sign'] != null) {
		data.userSign = json['user_sign'].toString();
	}
	return data;
}

Map<String, dynamic> loginModelDataImToJson(LoginModelDataIm entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['role'] = entity.role;
	data['user_id'] = entity.userId;
	data['user_sign'] = entity.userSign;
	return data;
}