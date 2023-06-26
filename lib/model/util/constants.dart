import 'package:dio/dio.dart';

//TODO add baseUrl
const baseUrl = 'http://87.107.146.132:8070/';

final options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (status) => true,
  connectTimeout: const Duration(seconds: 50),
  receiveTimeout: const Duration(seconds: 50),
  contentType: 'application/json',
  headers: {
    //TODO add token
    "Authorization": "Token 45e54d4a5a4907acffbea9155c8e0686526f7629",
  },
);
final dio = Dio(options);
