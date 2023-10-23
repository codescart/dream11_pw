import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

Future<Map<String, dynamic>?> getUserProfile() async {
  print("getttttttt");

  try {
    DocumentSnapshot<Map<String, dynamic>> userDocument = await FirebaseFirestore.instance.collection('users').doc('49874').get();
    if (userDocument.exists) {
      print("getone");

      return userDocument.data();

    } else {

      if (kDebugMode) {
        print('User profile not found in FireStore.');
      }
      return null;
    }
  } catch (e) {

    if (kDebugMode) {
      print('Error getting user profile from FireStore: $e');
    }
    return null;
  }
}