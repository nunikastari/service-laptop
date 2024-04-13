import 'package:flutter/material.dart';
import 'servicedetail_screen.dart'; // Import widget ServiceDetailScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/servislaptop.jpg', 
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Service Laptopmu! <3',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 186, 163, 225), Color.fromARGB(255, 222, 221, 230)],
                ),
              ),
              child: ListView(
                children: [
                  ServiceItem(
                    title: 'Perbaikan Hardware',
                    icon: Icons.build,
                    onTap: () {
                      // Navigasi ke halaman detail layanan ketika layanan diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(serviceName: 'Perbaikan Hardware'),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Perbaikan Software',
                    icon: Icons.code,
                    onTap: () {
                      // Navigasi ke halaman detail layanan ketika layanan diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(serviceName: 'Perbaikan Software'),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Upgrade Komponen',
                    icon: Icons.settings,
                    onTap: () {
                      // Navigasi ke halaman detail layanan ketika layanan diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(serviceName: 'Upgrade Komponen'),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Pembersihan Virus',
                    icon: Icons.security,
                    onTap: () {
                      // Navigasi ke halaman detail layanan ketika layanan diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(serviceName: 'Pembersihan Virus'),
                        ),
                      );
                    },
                  ),
                  ServiceItem(
                    title: 'Penggantian Baterai',
                    icon: Icons.battery_full,
                    onTap: () {
                      // Navigasi ke halaman detail layanan ketika layanan diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailScreen(serviceName: 'Penggantian Baterai'),
                        ),
                      );
                    },
                  ),
                  // Tambahkan jenis layanan lainnya...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 243, 247),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 241, 240, 243).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 50,
              color: Color.fromARGB(255, 113, 99, 234),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
