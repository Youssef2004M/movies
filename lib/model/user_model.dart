class UserModel {
  String name;
  String id;
  String email;
  String phone;

  UserModel({
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          name: json["name"],
          id: json["id"],
          email: json["email"],
          phone: json["phone"],
        );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "email": email,
      "phone": phone,
    };
  }
}
