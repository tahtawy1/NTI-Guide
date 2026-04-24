class UserModel {
  final String? uid;
  final String? email;
  final String? name;
  final String role;
  UserModel({
    this.uid,
    this.email,
    this.name,
    this.role = 'user',
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'role': role,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      role: map['role'],
    );
  }
}
