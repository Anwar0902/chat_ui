import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  print("1");
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;
  print("2");
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  print("3");
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
  print("4");
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  print("5");
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print("signed in");
  print(user);
  return 'signInWithGoogle succeeded: $user';
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var hover = false;
  var visible = true;
  final _formKey = GlobalKey<FormState>();
  void _incrementEnter(PointerEvent details) {
    print(hover);
    setState(() {
      hover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Form'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Email Address."
                  ),
                ),
                TextFormField(
                  controller: password,
                  obscureText: visible,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Password.",
                    suffixIcon: IconButton(
                      icon: Icon(
                        visible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 70, right: 70),
                  child: Card(
                    color: Colors.blue,
                    child: ListTile(
                      title: Text("Log In", style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.center),
                      onTap: () async {
                        print("anwat");
                        signInWithGoogle().whenComplete(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return FirstScreen();
                              },
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue[100],
        child: Text("anwar baba"),
      ),
    );
  }
}