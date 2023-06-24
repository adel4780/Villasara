import 'image.dart';

class Villa{
  int? id;
  int? villaOwner;
  int? state;
  String? city;
  String? region;
  String? address;
  String? description;
  double? pricePerNight;
  List<VillaImage>? images;
  String? createdAt;

  Villa({
    this.id,
    this.villaOwner,
    this.state,
    this.city,
    this.region,
    this.address,
    this.description,
    this.pricePerNight,
    this.images,
    this.createdAt,
});
  factory Villa.fromJson(Map<String, dynamic> json) {
    return Villa(
      id: json['id'],
      villaOwner: json['villa_owner'],
      state: json['state'],
      city: json['city'],
      region: json['region'],
      address: json['address'],
      description: json['description'],
      pricePerNight: json['pricePerNight'],
      createdAt: json['created_at']
    );
  }
  Map<String, dynamic> toJson() => {
    'id' : id,
    'villa_owner' : villaOwner,
    'state': state,
    'city': city,
    'region': region,
    'address': address,
    'description': description,
    'pricePerNight': pricePerNight,
  };
}