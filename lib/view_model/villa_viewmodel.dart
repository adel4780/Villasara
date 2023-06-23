import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/entity/image.dart';
import '../model/entity/villa.dart';
import '../model/repository/villa_repository_impl.dart';

class VillaViewModel extends ChangeNotifier {
  var repository = VillaRepositoryImpl();

  StreamController<List<Villa>> villas =
  StreamController<List<Villa>>();

  StreamController<List<VillaImage>> Images =
  StreamController<List<VillaImage>>();

  Future<void> getVillas(int id) async {
    villas.add(await repository.getVillas(id));
    notifyListeners();
  }
  Future<Villa> addVilla(Villa villa) async {
    var newVilla = await repository.addVilla(villa);
    notifyListeners();
    return newVilla;
  }
  Future<void> editVilla(Villa villa) async {
    await repository.editVilla(villa);
    notifyListeners();
  }
  Future<void> deleteVilla(Villa villa) async {
    await repository.deleteVilla(villa);
    notifyListeners();
  }
  Future<void> getImage(int id) async {
    Images.add(await repository.getImages(id));
    notifyListeners();
  }
  Future<VillaImage> addImage(VillaImage image) async {
    var newImage = await repository.addImage(image);
    notifyListeners();
    return newImage;
  }
  Future<void> editImage(VillaImage image) async {
    await repository.editImage(image);
    notifyListeners();
  }
  Future<void> deleteImage(VillaImage image) async {
    await repository.deleteImage(image);
    notifyListeners();
  }
}