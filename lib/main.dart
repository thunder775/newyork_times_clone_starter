import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/loading_widget.dart';
import 'package:newyork_times_clone_starter/network_helper.dart';
import 'package:newyork_times_clone_starter/newsCardWidget.dart';

void main() => runApp(MaterialApp(
      home: NewsListPage(),
    ));

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  NetworkHelper helper = new NetworkHelper();
  bool loading = false;
  List articles = [];

  @override
  void initState() {
    getList();

    super.initState();
  }

  void getList() async {
    isLoading();
    articles = await helper.getaData();
    notLoading();
  }

  void isLoading() {
    setState(() {
      loading = true;
    });
  }

  void notLoading() {
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'New Jerusalem Times',
          style: TextStyle(
              fontSize: 32, color: Colors.black, fontFamily: 'OldLondon'),
        ),
      ),
      body: loading
          ? LoadingWigdet()
          : ListView.builder(
              itemCount: 20,
              itemBuilder: (context, int index) {
                return new NewsCard(
                  title: articles[index]['title'],
                  description: articles[index]['description'],
                  imageUrl: articles[index]['urlToImage'],
                  sourceName: articles[index]['source']['name'],
                  content:articles[index]['content'] ,
                );
              },
            ),
    );
  }
}
