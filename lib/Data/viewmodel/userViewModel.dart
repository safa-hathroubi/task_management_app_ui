/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../socketService.dart';
import '../view/Components/custom_components/gradientButton.dart';
import '../view/screens/home.dart';
import '../view/components/themes/colors.dart';
import 'package:task_management/Data/models/user.dart' as user_model;

class UserViewModel extends ChangeNotifier {
  static String baseUrl = "10.0.2.2:8081";

  UserViewModel();

  static Future<void> login(String? email, String? password,
      BuildContext context, SocketService socketService) async {
    Map<String, dynamic> userData = {"email": email, "password": password};

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(baseUrl, "/login"),
            body: json.encode(userData), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = json.decode(response.body);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userId", userData["id"]);
        prefs.setString("userID", userData["userId"]);
        prefs.setString("username", userData["username"]);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NavigationBottom(userData["username"],
                    userData["profile_image"], userData["id"])));
        //Get.offAll(NavigationBottom(
        //userData["username"], userData["profile_image"], userData["id"]));
      } else if (response.statusCode == 400) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign in failed",
                      style: TextStyle(color: AppColors.primary)),
                  content: Text("Wrong password"));
            });
      } else if (response.statusCode == 402) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign in failed",
                      style: TextStyle(color: AppColors.primary)),
                  content: Text(
                      "Your Email has not been verified. Please check your mail"));
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign in failed",
                      style: TextStyle(color: AppColors.primary)),
                  content: Text(
                      "The email address is not associated with any account. please check and try again!"));
            });
      }
    });
  }

  static Future<void> signup(
      String? email,
      String? password,
      String? username,
      String? gender,
      String? option,
      String? dateofbirth,
      String? level,
      String? speciality,
      BuildContext context) async {
    Map<String, dynamic> userData = {
      "email": email,
      "password": password,
      "username": username,
      "gender": gender,
      "option": option,
      "dateofbirth": dateofbirth,
      "level": level,
      "speciality": speciality
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(baseUrl, "/signup"),
            body: json.encode(userData), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        Navigator.pushNamed(context, "/login");
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign up successful",
                      style: TextStyle(color: AppColors.primary)),
                  content:
                      Text("Please check your mail to verify your account"));
            });
      } else if (response.statusCode == 400) {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Sign up failed",
                      style: TextStyle(color: AppColors.primary)),
                  content:
                      Text("Account already exists please use another email"));
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Network error",
                      style: TextStyle(color: AppColors.primary)),
                  content: Text(
                      "please check your internet connection and try again!"));
            });
      }
    });
  }

  static Future<void> forgotPassword(
      String? email, BuildContext context) async {
    Map<String, dynamic> userData = {"email": email};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email.toString());

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(baseUrl, "/reset"),
            body: json.encode(userData), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        String token = jsonResponse["token"];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => reset2Page(token)),
        );
      } else if (response.statusCode == 400) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text("NOT FOUND",
                      style: TextStyle(color: AppColors.primary)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "media/notfound.png",
                        height: 300,
                        width: 300,
                      ),
                      const Text(
                          "The email address is not associated with any account. please check and try again!"),
                    ],
                  ));
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text("Network error",
                      style: TextStyle(color: AppColors.primary)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'media/No connection-bro.png',
                        height: 300,
                        width: 300,
                      ),
                      const Text(
                          "please check your internet connection and try again!"),
                    ],
                  ));
            });
      }
    });
  }

  static Future<void> resetpassword(
      String? email, String? password, BuildContext context) async {
    Map<String, dynamic> userData = {
      "email": email,
      "newpassword": password,
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    http
        .post(Uri.http(baseUrl, "/resetpassword"),
            body: json.encode(userData), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        // navigate to the login page via route
        Navigator.pushNamed(context, "/login");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text("Password reset successful",
                      style: TextStyle(color: AppColors.primary)),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'media/Ok-bro.png',
                        height: 300,
                        width: 300,
                      ),
                      const Text(
                          "Your password has been successfully reset . you can now login with your new password"),
                    ],
                  ));
            });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                  title: Text("Network error",
                      style: TextStyle(color: AppColors.primary)),
                  content: Text(
                      "please check your internet connection and try again!"));
            });
      }
    });
  }

  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the Google sign-in
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      // Check if the user is already registered in the app
      final response = await http
          .get(Uri.http(baseUrl, '/checkuser/${googleUser.email}'),
              headers: headers)
          .then((http.Response response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> userData = json.decode(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(userData["username"],
                    userData["profile_image"], userData["id"])),
          );
        } else if (response.statusCode == 201) {
          // show a dialog to ask the user to register
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text("Login failed",
                        style: TextStyle(color: AppColors.primary)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'media/Forgot password-bro.png',
                          height: 300,
                          width: 300,
                        ),
                        const Text(
                            "Please verify your email address before logging in"),
                      ],
                    ));
              });
        } else if (response.statusCode == 400) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text("Sign up",
                        style: TextStyle(color: AppColors.primary)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'media/Forgot password-bro.png',
                          height: 300,
                          width: 300,
                        ),
                        const Text(
                            "You are not registered in the app please sign up first"),
                      ],
                    ));
              });
        } else {
          // Handle other error codes as needed
          throw Exception('Failed to check user registration');
        }
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text("Some thing went wrong",
                    style: TextStyle(color: AppColors.primary)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'media/No connection-bro.png',
                      height: 300,
                      width: 300,
                    ),
                    const Text("something went wrong pleas try again!"),
                  ],
                ));
          });
    }
    return null;
  }
/* SIGNUP WITH GOOGLE
  static Future<UserCredential?> signupWithGoogle(BuildContext context) async {
    try {
      await GoogleSignIn().signOut();
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the Google sign-in
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8"
      };

      // Check if the user is already registered in the app
      final response = await http
          .get(Uri.http(baseUrl, '/checkuser/${googleUser.email}'),
              headers: headers)
          .then((http.Response response) {
        if (response.statusCode == 200) {
          Map<String, dynamic> userData = json.decode(response.body);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(userData["username"],
                    userData["profile_image"], userData["id"])),
          );
        } else if (response.statusCode == 201) {
          // show a dialog to ask the user to register
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: const Text("You're already registered",
                        style: TextStyle(color: AppColors.primary)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'media/Forgot password-bro.png',
                          height: 300,
                          width: 300,
                        ),
                        const Text(
                            "you are already registered in the app please verify your account and login"),
                      ],
                    ));
              });
        } else if (response.statusCode == 400) {
          Navigator.pushNamed(context, "/login");
        } else {
          // Handle other error codes as needed
          throw Exception('Failed to check user registration');
        }
      });
    } catch (e) {
      //show a dialog with the error message
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text("Some thing went wrong",
                    style: TextStyle(color: AppColors.primary)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'media/No connection-bro.png',
                      height: 300,
                      width: 300,
                    ),
                    const Text("something went wrong pleas try again!"),
                  ],
                ));
          });
    }
    return null;
  }
*/
  static Future<Map<String, dynamic>> getUser(
      String? token, BuildContext context) async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    return http
        .get(Uri.http(baseUrl, "/getUserById/$token"), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);

        return {
          'username': jsonBody['username'],
          'profile_image': jsonBody['profile']['profile_image'],
        };
      } else {
        throw Exception('Failed to load user');
      }
    });
  }

  static Future<List<SearchUser>> searchUsers(String query) async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    return http
        .get(Uri.parse('http://$baseUrl/search?search=$query'),
            headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<SearchUser> users = jsonData
            .map<SearchUser>((userJson) => SearchUser.fromJson(userJson))
            .toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    });
  }

  static Future<List<user_model.User>> getUsers() async {
    Map<String, String> headers = {
      "Content-Type": "application/json; charset=UTF-8"
    };

    return http
        .get(Uri.http(baseUrl, "/getUsers"), headers: headers)
        .then((http.Response response) async {
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<user_model.User> users = jsonData
            .map<user_model.User>(
                (userJson) => user_model.User.fromJson(userJson))
            .toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    });
  }
}


//CUSTOMIZE THIS
class NavigationBottom extends StatelessWidget {
  final String username;
  final String profileImage;
  final String userId;

  NavigationBottom(this.username, this.profileImage, this.userId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            SharedPreferences prefs = snapshot.data!;
            prefs.setString("userId", userId);
            prefs.setString("userID", userId);
            prefs.setString("username", username);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(username), // Display the username in the app bar
            ),
            body: Container(
              // Your content here
            ),
          );
        } else {
          return CircularProgressIndicator(); // Show a loading indicator while fetching SharedPreferences
        }
      },
    );
  }
}




//searchUser (model)
class SearchUser {
  final String username;
  final String profileId;
  final String profileImage;
  final String userId;

  SearchUser(
      {required this.username,
        required this.profileId,
        required this.profileImage,
        required this.userId});

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
      username: json['username'],
      profileId: json['profile']['_id'],
      profileImage: json['profile']['profile_image'],
      userId: json['_id'],
    );
  }
}


//RESEt PASSWORD
class reset2Page extends StatefulWidget {
  final String? token;
  final String? code = "";
  const reset2Page(this.token, {Key? key}) : super(key: key);

  @override
  reset2PageState createState() => reset2PageState();
}

class reset2PageState extends State<reset2Page> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<String?> getEmail() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString("email");
    }

    final TextEditingController controller1 = TextEditingController();
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();
    final TextEditingController controller4 = TextEditingController();
    String? email;

    final mailphoto = SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("media/My password-pana.png"),
    );

    final codefield = Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textFieldOTP(first: true, last: false, controller: controller1),
          const SizedBox(width: 5),
          _textFieldOTP(first: false, last: false, controller: controller2),
          const SizedBox(width: 5),
          _textFieldOTP(first: false, last: false, controller: controller3),
          const SizedBox(width: 5),
          _textFieldOTP(first: false, last: true, controller: controller4),
        ],
      ),
    );

    Future<void> verifyCode() async {
      final String code = controller1.text +
          controller2.text +
          controller3.text +
          controller4.text;

      if (widget.token == code) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const reset3Page()));
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text("Wrong Code",
                      style: TextStyle(color: AppColors.primary)),
                  content: Image.asset(
                    "media/Warning-cuate.png",
                    height: 300,
                    width: 300,
                  ));
            });
      }
    }

    final verifyButton = SizedBox(
      width: double.infinity,
      child: gradientButton(
        borderRadius: BorderRadius.circular(30.0),
        width: double.infinity,
        height: 60.0,
        gradient: AppColors.gradient1,
        child: const Text(
          'Verify',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontFamily: 'Mukata Malar',
          ),
        ),
        onPressed: () {
          verifyCode();
        },
      ),
    );
    return Scaffold(
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 350.0,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: mailphoto,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(35, 40, 35, 30),
              child: Column(
                children: const [
                  Text('You\'re almost there !',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 25,
                        fontFamily: 'Mukata Malar',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                  SizedBox(height: 15),
                  Text('Check your email for a code and enter it below',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Mukata Malar',
                      ),
                      textAlign: TextAlign.center),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 230.0,
              margin: const EdgeInsets.fromLTRB(35, 0, 35, 30),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    codefield,
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                      child: verifyButton,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Didn\'t receive the email?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Mukata Malar',
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: const Text('Resend Code',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontFamily: 'Mukata Malar',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.center),
                  onTap: () {
                    getEmail().then((value) {
                      email = value;
                      UserViewModel.forgotPassword(email, context);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldOTP(
      {required bool first, last, TextEditingController? controller}) {
    return SizedBox(
      height: 85,
      width: 70,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 2, color: AppColors.lightgray),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 2, color: AppColors.primary),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
//TODO: MOVE reset2Page TO A SEPARATE FILE


/// BELOW: RESET 3
class reset3Page extends StatefulWidget {
  const reset3Page({Key? key}) : super(key: key);

  @override
  reset3PageState createState() => reset3PageState();
}

class reset3PageState extends State<reset3Page> {
  String? _email;
  String? _password;

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  Future<String?> _getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mailphoto = SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("media/Reset password-cuate (1).png"),
    );

    final password = TextFormField(
      onSaved: (String? value) {
        _password = value;
      },
      minLines: 1,
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryDark),
          borderRadius: BorderRadius.circular(32.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32.0),
        ),
        filled: true,
        fillColor: AppColors.darkwhite,
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.darkgray,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
    final confirmPassword = TextFormField(
      onSaved: (String? value) {},
      minLines: 1,
      maxLines: 1,
      keyboardType: TextInputType.visiblePassword,
      autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'confirm password',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryDark),
          borderRadius: BorderRadius.circular(32.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32.0),
        ),
        filled: true,
        fillColor: AppColors.darkwhite,
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.darkgray,
        ),
      ),
      validator: (value) {
        _keyForm.currentState!.save();
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
    );

    final sendButton = SizedBox(
      width: double.infinity,
      child: gradientButton(
        borderRadius: BorderRadius.circular(30.0),
        width: double.infinity,
        height: 60.0,
        gradient: AppColors.gradient1,
        child: const Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontFamily: 'Mukata Malar',
          ),
        ),
        onPressed: () {
          if (_keyForm.currentState!.validate()) {
            _keyForm.currentState!.save();
            _getEmail().then((value) {
              _email = value;
              UserViewModel.resetpassword(_email, _password, context);
            });
          }
        },
      ),
    );

    return Scaffold(
      body: Form(
        key: _keyForm,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 350.0,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: mailphoto,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(35, 0, 35, 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Great ! ',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 25,
                          fontFamily: 'Mukata Malar',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 20,
                    ),
                    Text('choose a new password ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Mukata Malar',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center),
                  ]),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(35, 10, 35, 30),
              child: password,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(35, 0, 35, 40),
              child: confirmPassword,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(35, 10, 35, 40),
              child: sendButton,
            ),
          ],
        ),
      ),
    );
  }
}
*/
