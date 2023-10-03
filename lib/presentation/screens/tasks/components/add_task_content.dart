part of '../tasks_screen.dart';

class _AddTaskContent extends StatefulWidget {
  final void Function(String text) onAddPressed;

  const _AddTaskContent({required this.onAddPressed});

  @override
  State<_AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<_AddTaskContent> {
  final _controller = TextEditingController();

  bool _canAddTask = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _canAddTask = _controller.value.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Title',
          ),
          controller: _controller,
        ),
        const SizedBox(height: 12),
        GestureDetector(
          key: UniqueKey(),
          onTap: _canAddTask
              ? () {
                  widget.onAddPressed(_controller.value.text);
                  Navigator.of(context).pop();
                }
              : null,
          child: Container(
            color: _canAddTask ? Colors.black : Colors.black26,
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
