import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Rail Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// MAIN PAGE
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// STATE
class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // menentukan isi halaman
    Widget content;
    switch (selectedIndex) {
      case 0:
        content = const Text("Home Page", style: TextStyle(fontSize: 24));
        break;
      case 1:
        content = const Text("Favorite Page", style: TextStyle(fontSize: 24));
        break;
      default:
        content = const Text("Home Page");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 4 - Navigation Rail"),
      ),

      body: Row(
        children: [
          // SIDEBAR
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorite'),
              ),
            ],
          ),

          const VerticalDivider(width: 1),

          // KONTEN
          Expanded(
            child: Center(child: content),
          ),
        ],
      ),
    );
  }
}