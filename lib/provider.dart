import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ApplicationColor with ChangeNotifier{
  bool _isLightBlue = true;       // underscore duluan menandakan private

  bool get isLightBlue => _isLightBlue;    //nama getter sama degan nama variabelnya tanpa _

  set isLightBlue(bool value) {         //nama setter sama degan nama variabelnya tanpa _
    _isLightBlue = value;
    notifyListeners();
  }

  Color get getColor => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}