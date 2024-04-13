import 'package:flutter/material.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/news_feeds.dart'; // Import NewsFeed screen
import 'package:my_app/screens/review_screen.dart';
import 'package:my_app/screens/history_screen.dart';
import 'package:my_app/screens/sec_screen.dart';
import 'package:my_app/screens/servicescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ReviewScreen(),
    const HistoryScreen(selectedLocation: ''),
    const SecondScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Review',
    'History',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Nunik Astari'), 
              accountEmail: Text('nunikastari@gmail')),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/nunik.jpg'),
                radius: 20,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.newspaper),
                title: Text('News Feed'),
                onTap: () {
                  Navigator.of(context).pop(); // Close drawer
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NewsFeed(), // Navigate to NewsFeed screen
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.build),
                title: Text('Service'),
                onTap: () {
                  Navigator.of(context).pop(); // Close drawer
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceScreen(), // Navigate to NewsFeed screen
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
