class User {
  int? id;
  String name;
  String email;
  String phone;
  String? avatar;
  DateTime dateOfBirth;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,
    required this.dateOfBirth,
  });

  // User -> Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String()
    };
  }

  // Create User object from Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      avatar: map['avatar'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    DateTime? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth
    );
  }
}