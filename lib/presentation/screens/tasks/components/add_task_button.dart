part of '../tasks_screen.dart';

class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton({
    required TasksBloc bloc,
  }) : _bloc = bloc;

  final TasksBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return _AddTaskContent(
            onAddPressed: (text) => _bloc.add(TasksAddPressed(text)),
          );
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'Add task',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
