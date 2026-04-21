import 'dart:convert';
import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

import '../config/env.dart';

final env = DotEnv()..load();

class AuthService {
  Future<String> getToken() async {
    final url = Uri.parse('https://api.intra.42.fr/oauth/token');
    final response = await http.post(
      url,
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to get token');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data['access_token'] as String;
  }
}
