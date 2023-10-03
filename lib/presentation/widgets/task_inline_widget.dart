import 'package:flutter/material.dart';
import 'package:todo_list/domain/model/task.dart';

class TaskInlineWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onMarkedAsCompletePressed;
  final VoidCallback onRemovePressed;

  const TaskInlineWidget({
    super.key,
    required this.task,
    required this.onMarkedAsCompletePressed,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              task.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _IconButton(
            task.completed ? Icons.check : Icons.circle_outlined,
            task.completed ? null : onMarkedAsCompletePressed,
          ),
          _IconButton(
            Icons.delete_outline_outlined,
            onRemovePressed,
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onTap;

  const _IconButton(
    this.iconData,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
