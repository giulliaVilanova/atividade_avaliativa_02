import 'dart:convert';
import 'package:http/http.dart' as http;
import 'usuario.dart';

class ApiService {
  static Future<Usuario?> buscarUsuario(int id) async {
    final url = 'https://reqres.in/api/users/$id';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['data'] != null) {
          return Usuario.fromJson(data['data']);
        }
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
