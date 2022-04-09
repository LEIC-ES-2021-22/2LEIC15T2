import 'package:flutter/material.dart';
import 'package:flutter_code/main.dart';
import 'package:flutter_code/src/objects/facility.dart';

class MyForm extends StatelessWidget {
  final Facility facility;
  const MyForm({Key? key, required this.facility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('FEUPQ'),
        ),
      ),
      body: Column(
        children: [
          Text('\n ${facility.name} Estado'),
          const _TaskList(),
          ElevatedButton(
            child: const Text('Submeter'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeView(authToken: "token")),
              );
            },
          )
        ],
      ),
    );
  }
}

// Underscore before class means its private
class _TaskList extends StatelessWidget {
  const _TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TaskItem(label: 'Bom'),
        TaskItem(label: 'Mais ou Menos'),
        TaskItem(label: 'Mau'),
      ],
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  const TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue),
          value: _value,
        ),
        Text(widget.label),
      ],
    );
  }
}
