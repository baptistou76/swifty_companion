import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'auth_service.dart';

final _logger = Logger('Api42Service');

class Api42Service {
  Future<Map<String, dynamic>> fetchUser(String login) async {
    try {
      final auth = AuthService();
      final token = await auth.getToken();
      final url = Uri.parse('https://api.intra.42.fr/v2/users/$login');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode != 200) {
        throw Exception(
          'API request failed: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
      final data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) {
        return data;
      }
      return {'error': 'Unexpected response', 'raw': data};
    } catch (e, stackTrace) {
      _logger.severe('Error fetching user:', e, stackTrace);
      rethrow;
    }
  }
}
