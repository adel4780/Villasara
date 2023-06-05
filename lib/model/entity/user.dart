class User{
  int? id;
  String? role;
  String? first_name;
  String? last_name;
  String? code_meli;
  String? phone_number;
  String? email;
  String? home_number;



  User({
    this.id,
    this.role,
    required this.phone_number,
    this.first_name,
    this.last_name,
    this.code_meli,
    this.email,
    this.home_number
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      role: json["role"],
      phone_number: json["phone_number"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      code_meli: json["code_meli"],
      email: json["email"],
      home_number: json["home"]

    );
  }
  Map<String, dynamic> toJson()=> {
    'role' : role,
    'phone_number':phone_number,
    'first_name' : first_name,
    'last_name' : last_name,
    'code_meli': code_meli,
    'email' : email,
    'home_number':home_number
  };
}