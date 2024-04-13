import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // List nama orang yang dapat diajak chat
  final List<String> _contacts = ['Media Jaya Laptop', 'RC Laptop singaraja', 'Delta Computer', 'Cempaka Laptop'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih kontak'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text( // Gunakan inisial sebagai lambang
                _contacts[index][0],
                style: TextStyle(fontSize: 24),
              ),
            ),
            title: Text(_contacts[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatDetailScreen(contactName: _contacts[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  final String contactName;

  const ChatDetailScreen({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3, 
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Pesan dari $contactName'),
                );
              },
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Color.fromARGB(255, 159, 153, 203),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ketik Pesanmu...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              // Implementasi logika pengiriman pesan
            },
            child: Text('Kirim'),
          ),
        ],
      ),
    );
  }
}
