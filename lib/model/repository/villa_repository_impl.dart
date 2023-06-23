import '../entity/image.dart';
import '../entity/villa.dart';
import '../util/constants.dart';
import 'villa_repository.dart';

class VillaRepositoryImpl extends VillaRepository {

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
  Future<List<VillaImage>> getImages(int id) async {
    var response = await dio.get('Images/');
    print('response: ${response.statusMessage}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<VillaImage> images = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var image = VillaImage.fromJson(data);
          images.add(image);
        }
      }
      return images;
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
  Future<VillaImage> addImage(VillaImage image) async {
    var response = await dio.post(
      'Images/',
      data: image,
    );
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    final newImage = VillaImage.fromJson(response.data);
    return newImage;
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
  Future<void> editImage(VillaImage image) async {
    var response = await dio.patch(
      'Images/${image.id}/',
      data: image,
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

  @override
  Future<void> deleteImage(VillaImage image) async {
    var response = await dio.delete(
      'Images/${image.id}/',
    );
    print('response: ${response.statusMessage}');
  }
}
