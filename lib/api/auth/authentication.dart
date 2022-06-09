import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

///  We have created a class named [Authentication] which contains all
///  the methods that we need to perform the authentication process.
///  ofc You are free to use any name you want
class Authentication {
  ///  [Client] is a class provided by the Appwrite SDK.
  ///  It is used to communicate with the Appwrite API.
  ///  We will be receiving this object from the constructor
  final Client client;

  ///  [Account] is also a class provided by the Appwrite SDK.
  ///  It is to access the all the account related methods. like get account
  ///  or create account , update account etc
  late Account account;

  Authentication(this.client) {
    account = Account(client);
  }

  Future<User?> getAccount() async {
    try {
      return await account.get();
    } on AppwriteException catch (e) {
      log(e.toString());
      return null;
    }
  }

  /// This will be invoked if the user didn't logged in
  /// and clicked play button directly
  void loginAnonymous() async {
    try {
      await account.createAnonymousSession();
    } on AppwriteException catch (e) {
      log(e.toString());
    }
  }

  // A function to login the user Discord OAuth
  Future<void> login(BuildContext context) async {
    try {
      await account.createOAuth2Session(
          provider: 'discord', scopes: ["identify", "email"]);
    } catch (e) {
      // print(e);
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Error Occured'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }

  ///  A function to logout the current user
  Future<void> logout(BuildContext context) async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      // print(e);
      await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Something went wrong'),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok"))
                ],
              ));
    }
  }
}
