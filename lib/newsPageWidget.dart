import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/photo_veiw.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  String title;
  String description;
  String imageUrl;
  String country;
  String source;
  String content;
  String date;
  String url;

  NewsPage(
      {this.url,
      this.date,
      this.imageUrl,
      this.description,
      this.title,
      this.content,
      this.source,
      this.country});

  @override
  Widget build(BuildContext context) {
    List<String> list = content.split('[');

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          color: Color(0xFFA6A6A6),
          icon: new Icon(Icons.chevron_left),
          tooltip: 'Air it',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          country,
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
            onPressed: () {
              Share.share(url);
            },
          ),
          new IconButton(
            color: Color(0xFFA6A6A6),
            icon: new Icon(Icons.toc),
            tooltip: 'Air it',
            onPressed: () {
              print(url);
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 15),
            child: Text(
              title ?? 'not available',
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          Container(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  print('hey');
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => ImageVeiwer(
                                imageUrl: imageUrl,
                              )));
                },
                child: Hero(
                  tag: '$title',
                  child: imageUrl == null
                      ? Center(
                          child: Text(
                          'no image found',
                          style: TextStyle(color: Color(0xFF606367)),
                        ))
                      : Image(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        ),
                ),
              )),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 15),
            child: Text(
              description ?? 'not available',
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 15,
                  color: Color(0xFFC6C6C6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
            child: Text(
              'by $source' ?? 'not available',
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
            child: Text(
              date.substring(0, 10) ?? 'not found',
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
              content != null ? '${list[0]}' : 'not available',
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 18,
                  color: Color(0xFF7B7B7B)),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                  icon: Icon(Icons.web),
                  backgroundColor: Color(0xFFA6A6A6).withOpacity(.3),
                  onPressed: () async {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  label: Text(
                    'Read More',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
