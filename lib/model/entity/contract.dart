class Contract {
  int? id;
  int? villaOwner;
  int? villa;
  int? tenant;
  String? totalPrice;
  int? peopleCount;
  String? startDate;
  String? endDate;
  String? landownerPhone;
  bool? is_confirmed_by_landowner;
  bool? is_confirmed_by_tenant;
  Contract({
    this.id,
    required this.villaOwner,
    required this.villa,
    required this.tenant,
    this.totalPrice,
    this.peopleCount,
    required this.startDate,
    required this.endDate,
    required this.landownerPhone,
    this.is_confirmed_by_landowner,
    this.is_confirmed_by_tenant,
  });
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      villaOwner: json['host'],
      villa: json['villa'],
      totalPrice: json['total_price'],
      peopleCount: int.parse(json['people_count']),
      tenant: json['guest'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      landownerPhone: json['landowner_phone_number'],
      is_confirmed_by_landowner: json['is_confirmed_by_landowner'],
      is_confirmed_by_tenant: json['is_confirmed_by_tenant'],
    );
  }
  Map<String, dynamic> toJson() => {
        //'id': id,
        'host': villaOwner,
        'villa': villa,
        'total_price': totalPrice,
        'people_count': peopleCount,
        'guest': tenant,
        'start_date': startDate,
        'end_date': endDate,
        'landowner_phone_number' :landownerPhone,
        'is_confirmed_by_landowner' :is_confirmed_by_landowner,
        'is_confirmed_by_tenant' : is_confirmed_by_tenant,
      };
}
