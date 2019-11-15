import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/loading_widget.dart';
import 'package:newyork_times_clone_starter/network_helper.dart';
import 'package:newyork_times_clone_starter/newsCardWidget.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      home: HomePageWithTab(),
    ));

class HomePageWithTab extends StatefulWidget {
  @override
  _HomePageWithTabState createState() => _HomePageWithTabState();
}

class _HomePageWithTabState extends State<HomePageWithTab>
     {


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  'India',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'USA',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  'New Zealand',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
            indicatorColor: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'New Jerusalem Times',
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontFamily: 'OldLondon'),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            NewsListPage(country: 'IN'),
            NewsListPage(country: 'US'),
            NewsListPage(country: 'NZ')
          ],
        ),
      ),
    );
  }
}

class NewsListPage extends StatefulWidget {
  String country;

  NewsListPage({this.country});

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage>
    with AutomaticKeepAliveClientMixin<NewsListPage> {
  @override
  get wantKeepAlive => true;
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
    helper.country = widget.country;
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
    super.build(context);
    return loading
        ? LoadingWigdet()
        : ListView.builder(
            itemCount: 20,
            itemBuilder: (context, int index) {
              return new NewsCard(
                url: articles[index]['url'],
                date: articles[index]['publishedAt'],
                country: widget.country,
                title: articles[index]['title'],
                description: articles[index]['description'],
                imageUrl: articles[index]['urlToImage'],
                sourceName: articles[index]['source']['name'],
                content: articles[index]['content'],
              );
            },
          );
  }
}
