import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Field',
      home: MyHomePage(title: 'Flutter TextField'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.purple),
              borderRadius: BorderRadius.circular(15.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.purple),
              borderRadius: BorderRadius.circular(15.0),
            ),
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.purple,
            ),
            labelStyle: const TextStyle(color: Colors.purple),
            hintText: 'Введите значение',
            helperText: 'Поле для поиска заметок',
            labelText: 'Search',
          ),
        ),
      )),
    );
  }
}
