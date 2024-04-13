import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatefulWidget {
  final String serviceName;

  const ServiceDetailScreen({Key? key, required this.serviceName}) : super(key: key);

  @override
  _ServiceDetailScreenState createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  bool serviceOrdered = false;
  String selectedLocation = 'Media Jaya Laptop'; // default selected location

  // Variable untuk menentukan apakah card ditekan atau tidak
  Map<String, bool> isCardPressed = {
    'Media Jaya Laptop': false,
    'RC Laptop Singaraja': false,
    'Delta Computer': false,
    'Cempaka Laptop': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName),
      ),
      backgroundColor: Color.fromARGB(255, 200, 191, 243), // Warna hijau estetik
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/${widget.serviceName.toLowerCase().replaceAll(' ', '_')}.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLocationCard('Media Jaya Laptop'),
                  _buildLocationCard('RC Laptop Singaraja'),
                  _buildLocationCard('Delta Computer'),
                  _buildLocationCard('Cempaka Laptop'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        serviceOrdered = true;
                      });
                    },
                    child: Text(serviceOrdered ? 'Layanan Telah Dipesan' : 'Pesan Layanan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCard(String location) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle nilai boolean untuk menentukan apakah card ditekan atau tidak
          isCardPressed[location] = !isCardPressed[location]!;
        });
      },
      child: Card(
        color: isCardPressed[location]! ? Colors.blue : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$location:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                _getServicePrice(widget.serviceName, location),
                style: TextStyle(fontSize: 16),
              ),
              Text(
                _getServiceDuration(widget.serviceName, location),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getServicePrice(String serviceName, String location) {
    // Return harga untuk setiap layanan
    switch (serviceName) {
      case 'Perbaikan Hardware':
        return location == 'Media Jaya Laptop' ? 'Harga: Rp 100.000' : 'Harga: Rp 120.000';
      case 'Perbaikan Software':
        return location == 'Media Jaya Laptop' ? 'Harga: Rp 80.000' : 'Harga: Rp 90.000';
      case 'Upgrade Komponen':
        return location == 'Media Jaya Laptop' ? 'Harga: Rp 150.000' : 'Harga: Rp 160.000';
      case 'Pembersihan Virus':
        return location == 'Media Jaya Laptop' ? 'Harga: Rp 120.000' : 'Harga: Rp 130.000';
      case 'Penggantian Baterai':
        return location == 'Media Jaya Laptop' ? 'Harga: Rp 50.000' : 'Harga: Rp 60.000';
      default:
        return 'Harga: -';
    }
  }

  String _getServiceDuration(String serviceName, String location) {
    // Return lama servis untuk setiap layanan
    switch (serviceName) {
      case 'Perbaikan Hardware':
        return location == 'Media Jaya Laptop' ? 'Lama Servis: 1 hari' : 'Lama Servis: 2 hari';
      case 'Perbaikan Software':
        return location == 'Media Jaya Laptop' ? 'Lama Servis: 1 jam' : 'Lama Servis: 1,5 jam';
      case 'Upgrade Komponen':
        return location == 'Media Jaya Laptop' ? 'Lama Servis: 3 jam' : 'Lama Servis: 4 jam';
      case 'Pembersihan Virus':
        return location == 'Media Jaya Laptop' ? 'Lama Servis: 1,5 jam' : 'Lama Servis: 2 jam';
      case 'Penggantian Baterai':
        return location == 'Media Jaya Laptop' ? 'Lama Servis: 30 menit' : 'Lama Servis: 1 jam';
      default:
        return 'Lama Servis: -';
    }
  }
}
