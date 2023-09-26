import 'package:flutter/material.dart';
import 'package:task_management/components/profile_sheet.dart';
import 'package:task_management/models/task_manager.dart';
import 'package:task_management/screens/empty_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:task_management/screens/task_item_screen.dart';
import 'package:task_management/screens/task_list_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0))),
                  context: context,
                  builder: (context) => const ProfileSheet());
            },
            icon: const Icon(Icons.account_circle),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<TaskManager>(context, listen: false);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskItemScreen(onCreate: (task) {
                        manager.addTask(task);
                        Navigator.pop(context);
                      })));
        },
        child: Icon(Icons.add),
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<TaskManager>(builder: (context, manager, child) {
      if (manager.taskModels.isNotEmpty) {
        return TaskListScreen(
          manager: manager,
        );
      } else {
        return const EmptyTaskScreen();
      }
    });
  }
}
