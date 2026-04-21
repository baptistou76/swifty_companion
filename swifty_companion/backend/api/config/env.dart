import 'package:dotenv/dotenv.dart';

final env = DotEnv()..load(['../../config/.env']);

String get clientId {
  return env['CLIENT_ID'] ?? '';
}

String get clientSecret {
  return env['CLIENT_SECRET'] ?? '';
}
