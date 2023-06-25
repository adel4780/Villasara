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
    // "Authorization": "Token de0f00e7167f66057f46b9816e6cc1d88f663fe8",
  },
);

final dio = Dio(options);
