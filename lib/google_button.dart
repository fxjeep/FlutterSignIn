import 'package:BTest/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'buttonBuilder.dart';

class SignInButton extends StatelessWidget {
  final Function onPressed;
  final ButtonsEnum button;

  /// mini is a boolean field which specify whether to use a square mini button.
  final bool mini;

  /// shape is to specify the custom shape of the widget.
  final ShapeBorder shape;
  final String text;

  /// overrides the default button text
  final EdgeInsets padding;

  /// overrides the default button padding
  final double elevation; // overrides the default button elevation

  /// The constructor is fairly self-explanatory.
  SignInButton(
    this.button,
    this.onPressed, {
    this.mini = false,
    this.padding = const EdgeInsets.all(0),
    this.shape,
    this.text,
    this.elevation = 2.0,
  })  : assert(button != null),
        assert(onPressed != null);

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
            image: AssetImage(
              button == ButtonsEnum.Google
                  ? 'assets/logos/google_light.png'
                  : 'assets/logos/google_dark.png',
              package: 'flutter_signin_button',
            ),
            height: 36.0,
          ),
        ),
      ),
      backgroundColor:
          button == ButtonsEnum.Google ? Color(0xFFFFFFFF) : Color(0xFF4285F4),
      onPressed: onPressed,
      padding: padding,
      innerPadding: EdgeInsets.all(0),
      shape: shape,
      height: 36.0,
    );
  }
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
      onPressed: onPressed,
      padding: padding,
      innerPadding: EdgeInsets.all(0),
      shape: shape,
      height: 36.0,
    );
  }
}
