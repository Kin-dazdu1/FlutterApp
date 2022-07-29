import 'package:firedart/auth/exceptions.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snack/snack.dart';
import 'navigation.dart';

class AuthGate extends StatefulWidget {
  @override
  _AuthGate createState() => _AuthGate();
  const AuthGate({
    Key? key,
  }) : super(key: key);
}

class _AuthGate extends State<AuthGate> {
  String? email;
  String? password;
  final _formKeyForms = GlobalKey<FormState>();
  var auth = FirebaseAuth.instance;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => Form(
                key: _formKeyForms,
                child: ListView(
                    cacheExtent: 20000000,
                    shrinkWrap: true,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 15.0,
                              ),
                              child: Image.asset(
                                'assets/logo.png',
                                scale: 0.01,
                                height: 150,
                                width: 150,
                              ),
                            ),
                            (Column(children: const [
                              Text(
                                'EO.kz',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 75.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'EDIL-ORAL.KZ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'OpenSans',
                                  fontSize: 28.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]))
                          ]),
                      const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 15.0,
                          ),
                          child: const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Enter your Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            labelText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email adress";
                            }
                            if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .stringMatch(value) ==
                                null) {
                              return "Not valid email";
                            }
                            return null;
                          },
                          onSaved: (value) => setState(() => email = value),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 15.0,
                          ),
                          child: const Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                          onSaved: (value) => setState(() => password = value),
                        ),
                      ),
                      
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: ElevatedButton.icon(
                            icon: _isLoading
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))
                                : const Icon(Icons.login),
                            label: _isLoading
                                ? const Text("Loading...")
                                : const Text("Sign in"),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              if (_formKeyForms.currentState!.validate()) {
                                _formKeyForms.currentState!.save();
                                dynamic _signUpResult;
                                try {
                                  _signUpResult =
                                      await auth.signIn(email!, password!);
                                } on AuthException catch (e) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  if (e.message == "EMAIL_NOT_FOUND") {
                                    const SnackBar(
                                            content: Text("Email not found"))
                                        .show(context);
                                  }
                                  if (e.message == "INVALID_PASSWORD") {
                                    const SnackBar(
                                            content: Text("Invalid password"))
                                        .show(context);
                                  }
                                }
                                if (_signUpResult != null &&
                                    !_signUpResult
                                        .toString()
                                        .contains("AuthException:")) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  const SnackBar(
                                          content:
                                              Text("Succesfully logged in"))
                                      .show(context);
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  preferences.setString("email", email!);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const InitialWidget()),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      )
                    ]))));
  }
}
