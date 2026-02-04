// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiRequest _$UserApiRequestFromJson(Map<String, dynamic> json) =>
    UserApiRequest(
      headers: RequestHeaders.fromJson(json['headers'] as Map<String, dynamic>),
      request: RequestData.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserApiRequestToJson(UserApiRequest instance) =>
    <String, dynamic>{'headers': instance.headers, 'request': instance.request};

RequestHeaders _$RequestHeadersFromJson(Map<String, dynamic> json) =>
    RequestHeaders(
      token: json['token'] as String,
      appVersion: json['appVersion'] as String,
    );

Map<String, dynamic> _$RequestHeadersToJson(RequestHeaders instance) =>
    <String, dynamic>{
      'token': instance.token,
      'appVersion': instance.appVersion,
    };

RequestData _$RequestDataFromJson(Map<String, dynamic> json) => RequestData(
  usergroup: json['usergroup'] as String,
  groupName: json['groupName'] as String,
);

Map<String, dynamic> _$RequestDataToJson(RequestData instance) =>
    <String, dynamic>{
      'usergroup': instance.usergroup,
      'groupName': instance.groupName,
    };
