class Contract {
  int? id;
  int? villaOwner;
  int? villa;
  int? tenant;
  double? totalPrice;
  bool? isConfirmedLandowner;
  bool? isConfirmedTenant;
  String? startDate;
  String? endDate;
  Contract({
    this.id,
    this.villaOwner,
    this.villa,
    this.tenant,
    this.totalPrice,
    this.isConfirmedLandowner,
    this.isConfirmedTenant,
    this.startDate,
    this.endDate,
  });
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
        id: json['id'],
        villaOwner: json['villa_owner'],
        villa: json['villa'],
        totalPrice: json['total_price'],
        isConfirmedLandowner: json['is_confirmed_by_landowner'],
        isConfirmedTenant: json['is_confirmed_by_tenant'],
        tenant: json['tenant'],
        startDate: json['start_date'],
        endDate: json['end_date']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'villa_owner': villaOwner,
        'villa': villa,
        'total_price': totalPrice,
        'is_confirmed_by_landowner': isConfirmedLandowner,
        'is_confirmed_by_tenant': isConfirmedTenant,
        'tenant': tenant,
        'start_date': startDate,
        'end_date': endDate,
      };
}
