import '../entity/villa.dart';

abstract class VillaRepository{
  Future<List<Villa>> getVillas(int businessOwnerId);

  Future<Villa> addVilla(Villa villa);

  Future<void> editVilla(Villa villa);

  Future<void> deleteVilla(Villa villa);
}