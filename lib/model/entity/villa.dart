import 'image.dart';

class Villa {
  int? id;
  String? name;
  int? villaOwner;
  int? state;
  String? city;
  String? region;
  String? address;
  String? description;
  double? pricePerNight;
  List<String>? images;
  String? createdAt;
  String? startDate;
  String? endDate;

  Villa({
    this.id,
    this.name,
    this.villaOwner,
    this.state,
    this.city,
    this.region,
    this.address,
    this.description,
    this.pricePerNight,
    this.images,
    this.createdAt,
    this.startDate,
    this.endDate,
  });
  factory Villa.fromJson(Map<String, dynamic> json) {
    return Villa(
      id: json['id'],
      name: json['name'],
      villaOwner: json['villa_owner'],
      state: json['state'],
      city: json['city'],
      region: json['region'],
      address: json['address'],
      description: json['description'],
      pricePerNight: json['pricePerNight'],
      createdAt: json['created_at'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'villa_owner': villaOwner,
        'state': state,
        'city': city,
        'region': region,
        'address': address,
        'description': description,
        'pricePerNight': pricePerNight,
        'startDate': startDate,
        'endDate': endDate,
      };
}
