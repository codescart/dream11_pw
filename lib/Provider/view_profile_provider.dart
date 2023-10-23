import 'package:flutter/material.dart';
import '../Model/view_profile_model.dart';

class ProfileViewProvider with ChangeNotifier {
  ViewProfileModel? _userData;

  ViewProfileModel? get userData => _userData;

  void setUser(ViewProfileModel userData) {
    _userData = userData;
    notifyListeners();
  }
}
