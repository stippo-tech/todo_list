import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:todo_list/data/exception/tasks_operation_exception.dart';
import 'package:todo_list/data/repository/base_repository.dart';
import 'package:todo_list/domain/model/task.dart';
import 'package:todo_list/domain/repository/tasks_repository.dart';

final class TasksRepositoryImpl extends BaseRepository
    implements TasksRepository {
  @override
  Future<List<Task>> getAllTasks() async {
    final response = await http.get(baseUri);
    if (response.statusCode != 200) {
      throw TasksFetchException();
    }
    final data = jsonDecode(response.body) as List<Map<String, dynamic>>;
    return data.map((e) => Task.fromJson(e)).toList();
  }

  @override
  Future<void> addTask({required String title}) async {
    final response = await http.post(
      baseUri,
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
      body: jsonEncode({'title': title}),
    );
    if (response.statusCode != 200) {
      throw TasksAddException();
    }
  }

  @override
  Future<void> updateTask({
    required String url,
    bool? completeness,
    String? title,
  }) async {
    final response = await http.patch(
      baseUri,
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
      body: jsonEncode({
        if (title != null) 'title': title,
        if (completeness != null) 'completed': completeness,
      }),
    );
    if (response.statusCode != 200) {
      throw TasksUpdateException();
    }
  }

  @override
  Future<void> deleteTask(String url) async {
    final response = await http.delete(baseUri);
    if (response.statusCode != 200) {
      throw TasksDeleteException();
    }
  }
}
