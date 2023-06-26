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
  String? image1;
  String? image2;
  String? image3;
  String? createdAt;
  String? startDate;
  String? endDate;

  Villa({
    this.id,
    required this.name,
    required this.villaOwner,
    required this.state,
    required this.city,
    required this.region,
    required this.address,
    required this.description,
    required this.pricePerNight,
    this.image1,
    this.image2,
    this.image3,
    this.createdAt,
    required this.startDate,
    required this.endDate,
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
      pricePerNight: double.parse(json['price_per_night']),
      createdAt: json['created_at'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      image1: json['villa_image1'],
      image2: json['villa_image2'],
      image3: json['villa_image3'],
    );
  }
  Map<String, dynamic> toJson() => {
    //'id': id,
    'name': name,
    'villa_owner': villaOwner,
    'state': state,
    'city': city,
    'region': region,
    'address': address,
    'description': description,
    'price_per_night': pricePerNight,
    'start_date': startDate,
    'end_date': endDate,
    'villa_image1': image1,
    'villa_image2': image2,
    'villa_image3': image3,
  };
}
