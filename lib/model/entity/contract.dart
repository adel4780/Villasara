class Contract {
  int? id;
  int? villaOwner;
  int? villa;
  int? tenant;
  double? totalPrice;
  int? peopleCount;
  String? startDate;
  String? endDate;
  Contract({
    this.id,
    this.villaOwner,
    this.villa,
    this.tenant,
    this.totalPrice,
    this.peopleCount,
    this.startDate,
    this.endDate,
  });
  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      villaOwner: json['host'],
      villa: json['villa'],
      totalPrice: json['total_price'],
      peopleCount: json['people_count'],
      tenant: json['guest'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'host': villaOwner,
        'villa': villa,
        'total_price': totalPrice,
        'people_count': peopleCount,
        'guest': tenant,
        'start_date': startDate,
        'end_date': endDate,
      };
}
