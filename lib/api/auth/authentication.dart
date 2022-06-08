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
    return null;

    // TODO: Complete the getAccount method
  }

  // A function to login the user with email and password
  Future<void> login(BuildContext context) async {
    //TODO : Complete the login method
  }

  Future<void> loginAnonymous(BuildContext context) async {
    //TODO : Complete the loginAnonymous method
  }

  ///  A function to logout the current user
  Future<void> logout(BuildContext context) async {
    // TODO: Complete this function
  }
}
