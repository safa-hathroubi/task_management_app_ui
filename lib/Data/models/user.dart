class User {
  final int userID;
  final String firstName;
  final String lastName;
  int? phoneNumber;
  final String email;
  final String password;
  final String token;
  final String? profilePicture; //path or url to the image

  User({required this.userID,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    this.phoneNumber,
    required this.token,
    this.profilePicture,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
        profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'token': token,
      'profilePicture': profilePicture,
    };
  }

}

class Admin extends User {
  Admin({required super.userID,
    required super.email,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.token});
  // zid l admin-specific properties w methods here
}

class Officer extends User {
  Officer({required super.userID,
    required super.email,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.token});
// zid lproperties w methods here
}

class SuperAdmin extends User {
  SuperAdmin({required super.userID,
    required super.email,
    required super.password,
    required super.firstName,
    required super.lastName,
    required super.token});
// kifkif
}

class Team{
  final int teamID;
  String teamName;
  List<User> teamMembers;

  Team ({required this.teamID,
  required this.teamName,
  required this.teamMembers});

}