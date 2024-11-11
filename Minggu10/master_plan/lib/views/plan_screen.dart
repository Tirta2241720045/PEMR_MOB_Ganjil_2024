import 'package:flutter/material.dart';
import 'package:master_plan/models/task.dart';
import '../models/plan.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;

  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Safely find the current plan or return early if not found
          final currentPlanIndex =
              plans.indexWhere((p) => p.name == widget.plan.name);
          if (currentPlanIndex == -1) {
            return const Center(child: Text('Plan not found'));
          }
          final currentPlan = plans[currentPlanIndex];

          return Column(
            children: [
              Expanded(
                  child:
                      _buildList(currentPlan, plansNotifier, currentPlanIndex)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTaskDialog(context),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(labelText: 'Task Description'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final taskDescription = taskController.text;
                if (taskDescription.isNotEmpty) {
                  final planNotifier = PlanProvider.of(context);
                  final plans = planNotifier.value;
                  final planIndex =
                      plans.indexWhere((p) => p.name == widget.plan.name);

                  if (planIndex != -1) {
                    final currentPlan = plans[planIndex];
                    final updatedTasks = List<Task>.from(currentPlan.tasks)
                      ..add(Task(description: taskDescription));

                    final updatedPlans = List<Plan>.from(plans);
                    updatedPlans[planIndex] = Plan(
                      name: currentPlan.name,
                      tasks: updatedTasks,
                    );

                    planNotifier.value = updatedPlans;
                  }
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildList(Plan currentPlan, ValueNotifier<List<Plan>> planNotifier,
      int currentPlanIndex) {
    return ListView.builder(
      controller: scrollController,
      itemCount: currentPlan.tasks.length,
      itemBuilder: (context, taskIndex) {
        final task = currentPlan.tasks[taskIndex];
        return ListTile(
          leading: Checkbox(
            value: task.complete,
            onChanged: (selected) {
              if (selected != null) {
                final updatedTasks = List<Task>.from(currentPlan.tasks);
                updatedTasks[taskIndex] = Task(
                  description: task.description,
                  complete: selected,
                );

                final updatedPlans = List<Plan>.from(planNotifier.value);
                updatedPlans[currentPlanIndex] = Plan(
                  name: currentPlan.name,
                  tasks: updatedTasks,
                );

                planNotifier.value = updatedPlans;
              }
            },
          ),
          title: TextFormField(
            initialValue: task.description,
            onChanged: (text) {
              final updatedTasks = List<Task>.from(currentPlan.tasks);
              updatedTasks[taskIndex] = Task(
                description: text,
                complete: task.complete,
              );

              final updatedPlans = List<Plan>.from(planNotifier.value);
              updatedPlans[currentPlanIndex] = Plan(
                name: currentPlan.name,
                tasks: updatedTasks,
              );

              planNotifier.value = updatedPlans;
            },
          ),
        );
      },
    );
  }
}
