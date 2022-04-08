import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FEUPQ',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text('FEUPQ'),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open FEUPQ'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyForm()),
            );
          },
        ),
      ),
    );
  }
}



class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('FEUPQ'),
        ),
      ),
      body: Column(
        children: [
          Text('\nNúmero Parque'),
          TaskList(),
          Text('Estado'),
          TaskList2(),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label: '1'),
        TaskItem(label: '2'),
        TaskItem(label: '3'),
      ],
    );
  }
}

class TaskList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(label: 'Bom'),
        TaskItem(label: 'Mais ou Menos'),
        TaskItem(label: 'Mau'),
      ],
    );
  }
}

class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

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