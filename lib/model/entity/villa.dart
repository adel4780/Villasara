class Villa{
  int? id;
  String? state;
  String? city;
  String? region;
  String? address;
  String? description;
  String? pricePerNight;

  Villa({
    this.id,
    this.state,
    this.city,
    this.region,
    this.address,
    this.description,
    this.pricePerNight,
});
  factory Villa.fromJson(Map<String, dynamic> json) {
    return Villa(
      id: json['id'],
      state: json['state'],
      city: json['city'],
      region: json['region'],
      address: json['address'],
      description: json['description'],
      pricePerNight: json['pricePerNight'],

    );
  }
  Map<String, dynamic> toJson() => {
    'id' : id,
    'state': state,
    'city': city,
    'region': region,
    'address': address,
    'description': description,
    'pricePerNight': pricePerNight,
  };
}