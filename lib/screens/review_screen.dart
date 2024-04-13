// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:my_app/screens/chat_screen.dart'; // Import layar obrolan baru

// Model data untuk mewakili ulasan
class Review {
  final String profileImage;
  final String username;
  final String imageUrl;
  final String comment;
  int likes;
  int dislikes;

  Review({
    required this.profileImage,
    required this.username,
    required this.imageUrl,
    required this.comment,
    this.likes = 0,
    this.dislikes = 0,
  });
}

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  

  // Daftar ulasan dengan profil, gambar, dan komentar yang berbeda
  List<Review> reviews = [
    Review(
      profileImage: 'assets/images/ppimage.jpg',
      username: 'inidoraaa',
      imageUrl: 'assets/images/reviewlaptop1.jpg',
      comment: 'yeay terimakasi laptopnya bisa idup lagi😄',
    ),
    Review(
      profileImage: 'assets/images/ppimage2.jpg',
      username: 'ranggaaprmn',
      imageUrl: 'assets/images/reviewlaptop2.jpg',
      comment: 'baguss bangetttt',
    ),
    Review(
      profileImage: 'assets/images/ppimage3.png',
      username: 'nnxstr_',
      imageUrl: 'assets/images/reviewlaptop3.jpg',
      comment: 'timaaciiii',
    ),
  ];

  void _increment(Review review) {
    setState(() {
      review.likes++;
    });
  }

  void _decrement(Review review) {
    setState(() {
      review.dislikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postingan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (BuildContext context, int index) {
                final review = reviews[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(review.profileImage),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          review.username,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Image.asset(
                      review.imageUrl,
                      width: 350,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                    Divider(),
                    Text(
                      review.comment,
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () => _increment(review),
                          icon: Icon(Icons.thumb_up),
                          label: Text('${review.likes} Likes'),
                        ),
                        TextButton.icon(
                          onPressed: () => _decrement(review),
                          icon: Icon(Icons.thumb_down),
                          label: Text('${review.dislikes} Dislikes'),
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke layar obrolan saat tombol ditekan
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
        tooltip: 'Chat',
        child: Icon(Icons.chat),
      ),
    );
  }
}
