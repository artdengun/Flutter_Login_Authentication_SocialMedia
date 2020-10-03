import 'package:Flutter_Login_Authentication_SocialMedia/Auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ProfilePage.dart';
import 'LoginPage.dart';

class RegisterPage extends StatelessWidget {
  // final FirebaseUser user;
  TextEditingController _emailController = TextEditingController(text: "");
  TextEditingController _passController = TextEditingController(text: "");

  // RegisterPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: SafeArea(
            child: CustomScrollView(
          slivers: <Widget>[
            // sliver deleage ini akan selalu berada diatas
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                children: <Widget>[
                  Text(
                    "Hello.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Divider(
                      thickness: 3,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
// Tulisan Welcome back
              Text(
                "REGISTER ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 36,
                    letterSpacing: 5),
              ),
// Spasi
              SizedBox(height: 40),
// Form username & password
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _passController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          SignInSignUpResult result =
                              await AuthService.createUser(
                                  email: _emailController.text,
                                  pass: _passController.text);
                          if (result.user != null) {
                            // Go to Profile Page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                          user: result.user,
                                        )));
                          } else {
                            // Show Dialog
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Error"),
                                      content: Text(result.message),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                        )
                                      ],
                                    ));
                          }
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Color(0xFF4f4f4f),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
                ])),
            // SLiverFillRemaining ini akan selalu berada dibawa
          ],
        )),
      ),
    );
  }
}
