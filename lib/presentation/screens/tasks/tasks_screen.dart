import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/domain/model/task.dart';
import 'package:todo_list/presentation/screens/tasks/bloc/tasks_bloc.dart';
import 'package:todo_list/presentation/widgets/task_inline_widget.dart';

part 'components/add_task_content.dart';
part 'components/add_task_button.dart';
part 'components/filters.dart';

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
            _AddTaskButton(bloc: _bloc),
            const SizedBox(height: 12),
            Expanded(
              child: BlocBuilder<TasksBloc, TasksState>(
                  bloc: _bloc,
                  builder: (context, state) {
                    final List<Task>? filteredTasks = switch (state.filter) {
                      TasksFilter.all => state.tasks,
                      TasksFilter.completed =>
                        state.tasks?.where((task) => task.completed).toList(),
                      TasksFilter.unCompleted =>
                        state.tasks?.where((task) => !task.completed).toList(),
                    };

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
                        : Column(
                            children: [
                              _Filters(
                                selectedFilter: state.filter,
                                onTap: (filter) =>
                                    _bloc.add(TasksFilterPressed(filter)),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: filteredTasks?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final task = (filteredTasks ?? [])[index];
                                    return TaskInlineWidget(
                                      task: task,
                                      onMarkedAsCompletePressed: () =>
                                          _bloc.add(TasksMarkAsCompletedPressed(
                                              task)),
                                      onRemovePressed: () =>
                                          _bloc.add(TasksRemovePressed(task)),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
