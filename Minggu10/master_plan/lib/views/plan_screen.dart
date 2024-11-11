import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan(); // Pastikan Plan memiliki konstruktor yang benar
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Master Plan',
          style: TextStyle(
              color: Colors.white), // Mengatur warna font judul menjadi putih
        ),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
            color: Colors.white), // Mengatur warna ikon AppBar menjadi putih
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255,
          255), // Warna latar belakang Scaffold menjadi ungu muda
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      backgroundColor: Colors.purple,
      foregroundColor: Colors.white, // Mengatur warna ikon FAB menjadi putih
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)
              ..add(const Task()), // Penambahan Task baru
          );
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length, // Pastikan jumlah item ter-update
      itemBuilder: (context, index) {
        return _buildTaskTile(plan.tasks[index], index);
      },
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
    );
  }

  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
}
