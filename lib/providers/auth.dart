import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_wars/providers/client.dart';

import '../api/auth/authentication.dart';


final authProvider = Provider<Authentication>((ref) {
  return Authentication(ref.watch(clientProvider));
});


final userProvider = FutureProvider<User?>((ref) async {
  return ref.watch(authProvider).getAccount();
});


final userLoggedInProvider = StateProvider<bool?>((ref) {
  return null;
});
