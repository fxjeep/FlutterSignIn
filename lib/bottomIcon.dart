import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIcon extends StatelessWidget {
  final String _iconText;
  final IconData _icon;
  final VoidCallback _onButtonClick;

  BottomIcon({@required iconText, @required icon, @required clickCallback})
      : this._iconText = iconText,
        this._icon = icon,
        this._onButtonClick = clickCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            onTap: () {},
            child: IconButton(
                icon: Icon(_icon, size: 40, color: Colors.white),
                onPressed: () {
                  _onButtonClick();
                }),
          ),
          Text(
            _iconText,
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
