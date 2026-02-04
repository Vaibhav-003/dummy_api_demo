import 'package:json_annotation/json_annotation.dart';

part 'user_api_request.g.dart';

@JsonSerializable()
class UserApiRequest {
  @JsonKey(name: "headers")
  RequestHeaders headers;
  @JsonKey(name: "request")
  RequestData request;

  UserApiRequest({required this.headers, required this.request});

  factory UserApiRequest.fromJson(Map<String, dynamic> json) =>
      _$UserApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiRequestToJson(this);
}

@JsonSerializable()
class RequestHeaders {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "appVersion")
  String appVersion;

  RequestHeaders({required this.token, required this.appVersion});

  factory RequestHeaders.fromJson(Map<String, dynamic> json) =>
      _$RequestHeadersFromJson(json);

  Map<String, dynamic> toJson() => _$RequestHeadersToJson(this);
}

@JsonSerializable()
class RequestData {
  @JsonKey(name: "usergroup")
  String usergroup;
  @JsonKey(name: "groupName")
  String groupName;

  RequestData({required this.usergroup, required this.groupName});

  factory RequestData.fromJson(Map<String, dynamic> json) =>
      _$RequestDataFromJson(json);

  Map<String, dynamic> toJson() => _$RequestDataToJson(this);
}
