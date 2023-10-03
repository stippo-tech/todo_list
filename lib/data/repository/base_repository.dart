import 'package:http/http.dart' as http;

abstract base class BaseRepository {
  final baseUri =
      Uri.parse('https://csharp-todo-backend.azurewebsites.net/api/v1/todo');
  final client = http.Client();
}
