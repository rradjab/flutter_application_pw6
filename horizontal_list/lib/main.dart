import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sliver Widget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sliver Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Builder'),
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          double width = constraints.constrainWidth();

          debugPrint(width.toString());
          currentIndex = width < 500 ? 0 : 1;
          return IndexedStack(
            index: currentIndex,
            children: [
              GridView.builder(
                //key: const PageStorageKey<String>('page'),
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 300,
                itemBuilder: (context, index) => Card(
                  elevation: 15,
                  child: Center(child: Text('Item $index')),
                ),
              ),
              ListView.builder(
                //key: const PageStorageKey<String>('page'),
                controller: scrollController,
                itemCount: 300,
                itemBuilder: (context, index) => ListTile(
                  title: Column(
                    children: [
                      Center(child: Text('Item $index')),
                      const Divider()
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
