class GetUserResponse {
  bool success;
  List<User> data;
  String message;

  GetUserResponse(
      {required this.success, required this.data, required this.message});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      success: json['success'],
      data: List<User>.from(json['data'].map((x) => User.fromJson(x))),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
      'message': message,
    };
  }
}

class User {
  final String name;
  final String username;
  final String password;

  User(this.name, this.username, this.password);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['username'],
      json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
    };
  }
}
