import 'dart:convert';
import 'package:http/http.dart' as http;

class Api42Client {
  Future<Map<String, dynamic>> getUser(
    String login,
    String token,
  ) async {
    final url = Uri.parse('https://api.intra.42.fr/v2/users/$login');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('API request failed: ${response.statusCode}');
    }
    final data = jsonDecode(response.body);
    if (data is Map<String, dynamic>)
    {
      return data;
    }
    throw Exception('Invalid response format');
  }
}
