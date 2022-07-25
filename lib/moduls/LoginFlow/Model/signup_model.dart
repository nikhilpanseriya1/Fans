class SignupModel {
  SignupModel({
      String? username, 
      String? countriesId, 
      String? name, 
      String? email, 
      String? avatar, 
      String? cover, 
      String? status, 
      String? role, 
      String? permission, 
      String? confirmationCode, 
      String? oauthUid, 
      String? oauthProvider, 
      String? token, 
      String? story, 
      String? verifiedId, 
      String? ip, 
      String? language, 
      String? date, 
      int? id,}){
    _username = username;
    _countriesId = countriesId;
    _name = name;
    _email = email;
    _avatar = avatar;
    _cover = cover;
    _status = status;
    _role = role;
    _permission = permission;
    _confirmationCode = confirmationCode;
    _oauthUid = oauthUid;
    _oauthProvider = oauthProvider;
    _token = token;
    _story = story;
    _verifiedId = verifiedId;
    _ip = ip;
    _language = language;
    _date = date;
    _id = id;
}

  SignupModel.fromJson(dynamic json) {
    _username = json['username'];
    _countriesId = json['countries_id'];
    _name = json['name'];
    _email = json['email'];
    _avatar = json['avatar'];
    _cover = json['cover'];
    _status = json['status'];
    _role = json['role'];
    _permission = json['permission'];
    _confirmationCode = json['confirmation_code'];
    _oauthUid = json['oauth_uid'];
    _oauthProvider = json['oauth_provider'];
    _token = json['token'];
    _story = json['story'];
    _verifiedId = json['verified_id'];
    _ip = json['ip'];
    _language = json['language'];
    _date = json['date'];
    _id = json['id'];
  }
  String? _username;
  String? _countriesId;
  String? _name;
  String? _email;
  String? _avatar;
  String? _cover;
  String? _status;
  String? _role;
  String? _permission;
  String? _confirmationCode;
  String? _oauthUid;
  String? _oauthProvider;
  String? _token;
  String? _story;
  String? _verifiedId;
  String? _ip;
  String? _language;
  String? _date;
  int? _id;
SignupModel copyWith({  String? username,
  String? countriesId,
  String? name,
  String? email,
  String? avatar,
  String? cover,
  String? status,
  String? role,
  String? permission,
  String? confirmationCode,
  String? oauthUid,
  String? oauthProvider,
  String? token,
  String? story,
  String? verifiedId,
  String? ip,
  String? language,
  String? date,
  int? id,
}) => SignupModel(  username: username ?? _username,
  countriesId: countriesId ?? _countriesId,
  name: name ?? _name,
  email: email ?? _email,
  avatar: avatar ?? _avatar,
  cover: cover ?? _cover,
  status: status ?? _status,
  role: role ?? _role,
  permission: permission ?? _permission,
  confirmationCode: confirmationCode ?? _confirmationCode,
  oauthUid: oauthUid ?? _oauthUid,
  oauthProvider: oauthProvider ?? _oauthProvider,
  token: token ?? _token,
  story: story ?? _story,
  verifiedId: verifiedId ?? _verifiedId,
  ip: ip ?? _ip,
  language: language ?? _language,
  date: date ?? _date,
  id: id ?? _id,
);
  String? get username => _username;
  String? get countriesId => _countriesId;
  String? get name => _name;
  String? get email => _email;
  String? get avatar => _avatar;
  String? get cover => _cover;
  String? get status => _status;
  String? get role => _role;
  String? get permission => _permission;
  String? get confirmationCode => _confirmationCode;
  String? get oauthUid => _oauthUid;
  String? get oauthProvider => _oauthProvider;
  String? get token => _token;
  String? get story => _story;
  String? get verifiedId => _verifiedId;
  String? get ip => _ip;
  String? get language => _language;
  String? get date => _date;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['countries_id'] = _countriesId;
    map['name'] = _name;
    map['email'] = _email;
    map['avatar'] = _avatar;
    map['cover'] = _cover;
    map['status'] = _status;
    map['role'] = _role;
    map['permission'] = _permission;
    map['confirmation_code'] = _confirmationCode;
    map['oauth_uid'] = _oauthUid;
    map['oauth_provider'] = _oauthProvider;
    map['token'] = _token;
    map['story'] = _story;
    map['verified_id'] = _verifiedId;
    map['ip'] = _ip;
    map['language'] = _language;
    map['date'] = _date;
    map['id'] = _id;
    return map;
  }

}