import 'package:dio/dio.dart';
import '../entity/villa.dart';
import '../util/constants.dart';
import 'villa_repository.dart';

class VillaRepositoryImpl extends VillaRepository {
  var dio = Dio(options);

  @override
  Future<List<Villa>> getVillas(int businessOwnerId) async {
    var response = await dio.get('villa/?business_owner=$businessOwnerId');
    print(
        'response: ${response.statusMessage}   responceCode: ${response.statusCode}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Villa> villas = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var villa = Villa.fromJson(data);
          villas.add(villa);
        }
      }
      return villas;
    } else {
      throw Exception('Invalid response');
    }
  }

  @override
  Future<Villa> addVilla(Villa villa) async {
    var response = await dio.post(
      'villa/',
      data: villa,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newVilla = Villa.fromJson(response.data);
    return newVilla;
  }

  @override
  Future<void> editVilla(Villa villa) async {
    var response = await dio.patch(
      'villa/${villa.id}/',
      data: villa,
    );
    print('response: ${response.statusMessage}');
  }

  @override
  Future<void> deleteVilla(Villa villa) async {
    var response = await dio.delete(
      'villa/${villa.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
