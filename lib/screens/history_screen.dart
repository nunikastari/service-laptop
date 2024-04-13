import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key, required String selectedLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Belum Diservis'),
                Tab(text: 'Sedang Dikerjakan'),
                Tab(text: 'Sudah Selesai'),
              ],
            ),
            title: const Text('Aktivitas Service Laptop'),
          ),
          body: TabBarView(
            children: [
              // Content for "Belum Diservis"
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.hourglass_empty, size: 100),
                    SizedBox(height: 20),
                    Text('Belum ada aktivitas service laptop', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              // Content for "Sedang Dikerjakan"
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.build, size: 100),
                    SizedBox(height: 20),
                    Text('Sedang dalam proses pengerjaan', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              // Content for "Sudah Selesai"
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_circle, size: 100, color: Colors.green),
                    SizedBox(height: 20),
                    Text('Service laptop sudah selesai', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
