import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../model/entity/villa.dart';
import '../model/repository/villa_repository_impl.dart';

class VillaViewModel extends ChangeNotifier {
  var repository = VillaRepositoryImpl();

  StreamController<List<Villa>> villas =
  StreamController<List<Villa>>();

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
}