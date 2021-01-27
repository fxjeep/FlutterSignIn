import 'package:BTest/signin_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'buttonBuilder.dart';

class GoogleSignInWidget extends StatefulWidget {
  @override
  GoogleSignInState createState() => new GoogleSignInState();
}

class GoogleSignInState extends State<GoogleSignInWidget> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount _currentUser;

  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          const Text("Signed in successfully."),
          ElevatedButton(
              child: const Text('SIGN OUT'), onPressed: _handleSignOut),
          ElevatedButton(child: const Text('REFRESH'), onPressed: () {}),
        ],
      );
    } else {
      return new GoogleSignInButton(ButtonsEnum.Google, () => runSignIn());
    }
  }

  Future<void> runSignIn() async {
    try {
      await this._googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();
}

class GoogleSignInButton extends SignInButton {
  GoogleSignInButton(
    ButtonsEnum button,
    Function onPressed, {
    bool mini,
    EdgeInsets padding,
    ShapeBorder shape,
    String text,
    double elevation = 2.0,
  }) : super(button, onPressed,
            mini: mini,
            padding: padding,
            shape: shape,
            text: text,
            elevation: elevation);

  Widget build(BuildContext context) {
    return SignInButtonBuilder(
      elevation: elevation,
      key: ValueKey("Google"),
      text: text ?? 'Sign in with Google',
      textColor: button == ButtonsEnum.Google
          ? Color.fromRGBO(0, 0, 0, 0.54)
          : Color(0xFFFFFFFF),
      image: Container(
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: AssetImage(button == ButtonsEnum.Google
                ? 'assets/logos/google_light.png'
                : 'assets/logos/google_dark.png'),
            height: 36.0,
          ),
        ),
      ),
      backgroundColor:
          button == ButtonsEnum.Google ? Color(0xFFFFFFFF) : Color(0xFF4285F4),
      onPressed: () {
        this.onPressed();
      },
      padding: padding,
      innerPadding: EdgeInsets.all(0),
      shape: shape,
      height: 36.0,
    );
  }
}

//abbc7506@gmail.com
//client id 801841601791-6ijbpvp6m9h1tvrc46jmq57ooijvuide.apps.googleusercontent.com
//client secret: UsmJKn_g_esWpuW5yRaONSJp
