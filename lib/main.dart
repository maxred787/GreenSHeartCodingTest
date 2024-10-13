import 'package:flutter/material.dart';
import 'package:greensheart_coding_test_1/pages/home_page.dart';
import 'package:greensheart_coding_test_1/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GreenSHeart Coding Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GreenSHeart Coding Test'),
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const LoginPage();
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home,),
          ),
          BottomNavigationBarItem(
            tooltip: "Access account",
            label: "Login",
            icon: Icon(Icons.login,),
          ),
        ],
        currentIndex: _selectedIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        backgroundColor: theme.colorScheme.surfaceTint,
        unselectedItemColor: theme.colorScheme.surface,
        selectedItemColor: theme.colorScheme.inversePrimary,
        onTap: (idx) => {setState(() {_selectedIndex = idx;})},
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: "Urbanist", color: theme.colorScheme.surface),
        ),
      ),
      body: Center(
          child: Container(
            constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width > 600
                ? 600
                : MediaQuery.of(context).size.width),
            child: Row(children: [
              Expanded(
                child: Container(
                  child: page,
                )
              )
            ]
          ),
        )
      ),
    );
  }
}