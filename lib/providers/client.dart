import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider = Provider<Client>((ref) {
  return Client()
      .setEndpoint('http://localhost/v1')
      .setProject('miniwars')
      .setSelfSigned(status: true);
});
