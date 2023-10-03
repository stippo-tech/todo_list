sealed class TasksOperationException implements Exception {}

class TasksAddException implements TasksOperationException {}

class TasksUpdateException implements TasksOperationException {}

class TasksDeleteException implements TasksOperationException {}

class TasksFetchException implements TasksOperationException {}
