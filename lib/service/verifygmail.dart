import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_service.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  UserInfoScreenState createState() => UserInfoScreenState();
}

class UserInfoScreenState extends State<UserInfoScreen> {
  late bool _isEmailVerified;
  late User _user;

  bool _verificationEmailBeingSent = false;
  bool _isSigningOut = false;


  @override
  void initState() {
    _user = widget._user;
    _isEmailVerified = _user.emailVerified;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.indigo[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),


              const SizedBox(height: 24.0),
              _isEmailVerified
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.greenAccent.withOpacity(0.6),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.check,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Email is verified',
                    style: TextStyle(
                      color: Color(0xFFEE7C64),
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.redAccent.withOpacity(0.8),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Email is not verified',
                    style: TextStyle(
                      color:Colors.cyan,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Visibility(
                visible: !_isEmailVerified,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _verificationEmailBeingSent
                        ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    )
                        : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.red,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _verificationEmailBeingSent = true;
                        });
                        await _user.sendEmailVerification();
                        setState(() {
                          _verificationEmailBeingSent = false;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        User? user = await Authentication.refreshUser(_user);

                        if (user != null) {
                          setState(() {
                            _user = user;
                            _isEmailVerified = user.emailVerified;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'You are now signed in using Firebase Authentication. To sign out of your account click the "Sign Out" button below.',
                style: TextStyle(
                    color: Colors.blue.withOpacity(0.8),
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              const SizedBox(height: 16.0),
              _isSigningOut
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.redAccent,
                ),
              )
                  : ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.redAccent,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () async {

                  if (!mounted) return;
                     nextScreenReplace(context,const  HomePage());
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
