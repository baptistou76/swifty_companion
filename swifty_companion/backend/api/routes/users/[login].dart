import 'package:dart_frog/dart_frog.dart';
import '../../services/api_42_service.dart';

Future<Response> onRequest(
  RequestContext context,
  String login,
) async {
  final api = Api42Service();
  final user = await api.fetchUser(login);
  return Response.json(body: user);
}
