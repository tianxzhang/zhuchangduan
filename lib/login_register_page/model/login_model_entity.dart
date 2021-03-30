import 'package:zhuchangduan/generated/json/base/json_convert_content.dart';
import 'package:zhuchangduan/generated/json/base/json_field.dart';

class LoginModelEntity with JsonConvert<LoginModelEntity> {
	int code;
	String msg;
	LoginModelData data;
}

class LoginModelData with JsonConvert<LoginModelData> {
	String token;
	@JSONField(name: "user_info")
	LoginModelDataUserInfo userInfo;
	LoginModelDataCompany company;
	LoginModelDataIm im;
	@JSONField(name: "zc_fangyuan")
	List<String> zcFangyuan;
	@JSONField(name: "zc_message")
	String zcMessage;
}

class LoginModelDataUserInfo with JsonConvert<LoginModelDataUserInfo> {
	String id;
	String username;
	String nickname;
	dynamic avatar;
	String sex;
	dynamic idPhoto;
	String phone;
	String status;
	@JSONField(name: "area_id")
	String areaId;
	String bumen;
}

class LoginModelDataCompany with JsonConvert<LoginModelDataCompany> {
	String id;
	@JSONField(name: "area_name")
	String areaName;
	String address;
	@JSONField(name: "area_status")
	String areaStatus;
	@JSONField(name: "add_time")
	String addTime;
	@JSONField(name: "update_time")
	String updateTime;
	@JSONField(name: "admin_id")
	String adminId;
	String remarks;
}

class LoginModelDataIm with JsonConvert<LoginModelDataIm> {
	String role;
	@JSONField(name: "user_id")
	String userId;
	@JSONField(name: "user_sign")
	String userSign;
}
