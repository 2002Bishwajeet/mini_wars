import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: Replace with proper info
final clientProvider = Provider<Client>((ref) {
  return Client()
      .setEndpoint('[YOUR_ENDPOINT]')
      .setProject('[YOUR_PROJECT_ID]')
      .setSelfSigned(status: true);
});
