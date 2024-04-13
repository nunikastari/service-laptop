import 'package:flutter/material.dart';
import 'package:my_app/dto/News.dart';
import 'package:my_app/servis/dataservis.dart';
import 'package:my_app/screens/inputapi_screen.dart'; // tambahkan impor InputApi

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key); // tambahkan Key

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  Future<List<News>>? _news;

  @override
  void initState() {
    super.initState();
    _news = Dataservis.fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: _news,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => InputApi())); // ganti InputApi() dengan InputApi()
        },
        child: Icon(Icons.filter_list),
      ),
    );
  }
}
