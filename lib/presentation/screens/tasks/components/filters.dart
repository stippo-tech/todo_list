part of '../tasks_screen.dart';

class _Filters extends StatelessWidget {
  final TasksFilter selectedFilter;
  final void Function(TasksFilter) onTap;

  const _Filters({
    required this.selectedFilter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: TasksFilter.values
          .map((e) => GestureDetector(
                onTap: () => onTap(e),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedFilter == e ? Colors.blue : null,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    e.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: selectedFilter == e ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
