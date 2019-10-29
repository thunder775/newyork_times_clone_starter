import 'package:flutter/material.dart';
import 'package:newyork_times_clone_starter/newsPageWidget.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String sourceName;
  final String imageUrl;
  final String content;
  final String country;


  NewsCard({this.imageUrl, this.description, this.sourceName, this.title,this.content,this.country});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsPage(country: country,
                      title: title??'not available',
                      description: description,
                      imageUrl: imageUrl,source: sourceName,content: content,
                    )));
        print('hi');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 18, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 65,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        description??'not available',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'PlayfairDisplay', fontSize: 18),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 35,
                      child: Container(
                          color: Color(0xFFF3F4F4),
                          height: 90,
                          child: Hero( tag: '$title',
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
                          )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12),
              child: Row(
                children: <Widget>[
                  Text(
                    sourceName??'not available',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xFFA5A5A5),
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '1 hour(s) ago',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFA5A5A5),
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.share,
                    size: 19,
                    color: Color(0xFF587887),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.bookmark_border,
                    size: 19,
                    color: Color(0xFF587887),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Color(0xFFDDDDDD),
            )
          ],
        ),
      ),
    );
  }
}
