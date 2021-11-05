import 'dart:io';

import 'package:flutter/material.dart';

SnackBar upDateSnackbar(String message) {
  return SnackBar(content: Text(message));
}

Future<bool> checkInternetConnection() async {
  bool isConnected = false;

  try {
    final response = await InternetAddress.lookup('www.google.com');
    if (response.isNotEmpty) {
      isConnected = true;
    }
  } on SocketException catch (err) {
    isConnected = false;
    //print(err);
  }

  return isConnected;
}
