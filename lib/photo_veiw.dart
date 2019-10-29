import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
class ImageVeiwer extends StatefulWidget {
  String imageUrl;
  ImageVeiwer({this.imageUrl});
  @override
  _ImageVeiwerState createState() => _ImageVeiwerState();
}

class _ImageVeiwerState extends State<ImageVeiwer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(imageProvider: widget.imageUrl==null?AssetImage('assets/place.jpg') :NetworkImage(widget.imageUrl),minScale: .3,),
    );
  }
}
