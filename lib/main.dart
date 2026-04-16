import 'package:flutter/material.dart';
import 'home_page.dart';
import 'favorite_page.dart';

void main() {
  runApp(const MyApp());
}

// ROOT APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

// MAIN PAGE (Navigation Controller)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // pilih halaman berdasarkan index
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const FavoritePage();
        break;
      default:
        page = const HomePage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Step 5 - Multi Page"),
      ),

      body: Row(
        children: [
          // NavigationRail
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
                label: Text("Home"),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text("Favorite"),
              ),
            ],
          ),

          const VerticalDivider(width: 1),

          // Konten halaman
          Expanded(
            child: page,
          ),
        ],
      ),
    );
  }
}