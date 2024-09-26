import 'dart:io';

class ToDoItem {
  int taskId;
  String details;
  bool isDone;

  ToDoItem(this.taskId, this.details) : isDone = false;

  void showTask() {
    print('-----------------------------------------');
    print('Task ID: $taskId');
    print('Description: $details');
    print('Status: ${isDone ? 'Completed' : 'Pending'}');
  }

  void markAsDone() {
    this.isDone = true;
  }
}

class ToDoManager {
  final List<ToDoItem> _taskList = [];
  int _idCounter = 1;

  void createTask() {
    stdout.write('Enter task description: ');
    String? description = stdin.readLineSync();

    if (description != null && description.trim().isNotEmpty) {
      _taskList.add(ToDoItem(_idCounter, description.trim()));
      _idCounter++;
      print('Task added successfully.');
    } else {
      print('Task description cannot be empty.');
    }
  }

  void viewTasks() {
    if (_taskList.isEmpty) {
      print('No tasks available.');
    } else {
      for (var item in _taskList) {
        item.showTask();
      }
    }
  }

  void deleteTask() {
    stdout.write('Enter the task ID to delete: ');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      int taskId = int.parse(input);
      int initialLength = _taskList.length;
      _taskList.removeWhere((task) => task.taskId == taskId);

      if (initialLength != _taskList.length) {
        print('Task with ID $taskId has been removed.');
      } else {
        print('No task found with the given ID.');
      }
    } else {
      print('Invalid ID input.');
    }
  }

  void markTaskAsDone() {
    stdout.write('Enter the task ID to mark as completed: ');
    String? input = stdin.readLineSync();

    if (input != null && int.tryParse(input) != null) {
      int taskId = int.parse(input);
      bool found = false;

      for (var task in _taskList) {
        if (task.taskId == taskId) {
          task.markAsDone();
          found = true;
          print('Task with ID $taskId has been marked as completed.');
          break;
        }
      }

      if (!found) {
        print('Task ID not found.');
      }
    } else {
      print('Invalid ID input.');
    }
  }
}

void main() {
  ToDoManager manager = ToDoManager();
  bool isRunning = true;

  while (isRunning) {
    print('\n1. Add Task');
    print('2. View Tasks');
    print('3. Delete Task');
    print('4. Mark Task as Completed');
    print('5. Exit');
    stdout.write('Select an option: ');

    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        manager.createTask();
        break;
      case '2':
        manager.viewTasks();
        break;
      case '3':
        manager.deleteTask();
        break;
      case '4':
        manager.markTaskAsDone();
        break;
      case '5':
        print('Program terminated.');
        isRunning = false;
        break;
      default:
        print('Please enter a valid option (1-5).');
    }
  }
}