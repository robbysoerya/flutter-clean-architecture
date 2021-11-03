import 'package:flutter/material.dart';
import 'package:portfolio/src/core/utils/constants.dart';

class CustomSnackBar {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Key key;

  CustomSnackBar({
    required this.key,
    required this.scaffoldKey,
  });

  void showErrorSnackBar(final msg) {
    showSnackBar(text: "Error: $msg", color: Palette.snackBarColor);
  }

  ScaffoldMessengerState get _state {
    return ScaffoldMessenger.of(scaffoldKey.currentContext!);
  }

  void showLoadingSnackBar() {
    hideAll();
    final snackBar = SnackBar(
      key: key,
      content: Row(
        children: const <Widget>[
          CircularProgressIndicator(),
          SizedBox(width: 10.0),
          Text("Loading..."),
        ],
      ),
      backgroundColor: Colors.green[400],
      duration: const Duration(seconds: 3),
    );
    _state.showSnackBar(snackBar);
  }

  void showSnackBar({
    required String text,
    Duration duration = const Duration(hours: 1),
    Color? color,
    bool action = true,
  }) {
    hideAll();
    final snackBar = SnackBar(
      key: key,
      content: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: color ?? Colors.green[400],
      duration: duration,
      action: action
          ? SnackBarAction(
              label: "Clear",
              textColor: Colors.black,
              onPressed: () => _state.removeCurrentSnackBar(),
            )
          : null,
    );
    _state.showSnackBar(snackBar);
  }

  void hideAll() {
    _state.removeCurrentSnackBar();
  }
}
