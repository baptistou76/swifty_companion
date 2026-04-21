import '../clients/api42_client.dart';

class UserRepository 
{
  final Api42Client _client = Api42Client();
  Future<Map<String, dynamic>> fetchUser(
    String login,
    String token,
  ){
    return _client.getUser(login, token);
  }
}
