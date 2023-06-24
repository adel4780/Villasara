import '../entity/image.dart';
import '../entity/villa.dart';

abstract class VillaRepository{
  Future<List<Villa>> getVillas();

  Future<List<VillaImage>> getImages();

  Future<List<Villa>> searchVillas(int businessOwnerId);

  Future<List<VillaImage>> searchImages(int id);

  Future<Villa> addVilla(Villa villa);

  Future<VillaImage> addImage(VillaImage image);

  Future<void> editVilla(Villa villa);

  Future<void> editImage(VillaImage image);

  Future<void> deleteVilla(Villa villa);

  Future<void> deleteImage(VillaImage image);
}