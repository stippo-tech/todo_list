import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/screens/tasks/bloc/tasks_bloc.dart';
import 'package:todo_list/presentation/widgets/task_inline_widget.dart';

part 'components/add_task_content.dart';

@RoutePage()
class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final _bloc = TasksBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return _AddTaskContent(
                    onAddPressed: (text) => _bloc.add(TasksAddPressed(text)),
                  );
                },
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
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
            ),
            Expanded(
                child: BlocBuilder<TasksBloc, TasksState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      return state.fetchingTasks
                          ? const Center(
                              child: Text(
                                'LOADING...',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.tasks?.length ?? 0,
                              itemBuilder: (context, index) {
                                final task = (state.tasks ?? [])[index];
                                return TaskInlineWidget(
                                  task: task,
                                  onMarkedAsCompletePressed: () => _bloc
                                      .add(TasksMarkAsCompletedPressed(task)),
                                  onRemovePressed: () =>
                                      _bloc.add(TasksRemovePressed(task)),
                                );
                              },
                            );
                    })),
          ],
        ),
      ),
    );
  }
}
