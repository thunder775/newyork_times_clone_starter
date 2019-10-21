import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  String title;
  String description;
  String imageUrl;

  String source;
  String content;

  NewsPage(
      {this.imageUrl, this.description, this.title, this.content, this.source});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:  new IconButton(
        color: Color(0xFFA6A6A6),
        icon: new Icon(Icons.chevron_left),
        tooltip: 'Air it',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        backgroundColor: Colors.white,
        title: Text(
          'India',
          style: TextStyle(
              fontSize: 28,
              color: Color(0xFFA6A6A6),
              fontFamily: 'PlayfairDisplay'),
        ),
        actions: <Widget>[
          new IconButton(
            color: Color(0xFFA6A6A6),
            icon: new Icon(Icons.share),
            tooltip: 'Air it',
            onPressed: () {},
          ),
          new IconButton(
            color: Color(0xFFA6A6A6),
            icon: new Icon(Icons.toc),
            tooltip: 'Air it',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 15),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: Text(
              description,
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 18,
                  color: Color(0xFF7B7B7B)),
            ),
          ),
          Container(
              width: double.infinity,
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
              )),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 15),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 15,
                  color: Color(0xFFC6C6C6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
            child: Text(
              source,
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
            child: Text(
              '18-10-2019',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: Text(
              content,
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 18,
                  color: Color(0xFF7B7B7B)),
            ),
          ),
        ],
      ),
    );
  }
}
