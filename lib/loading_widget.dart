import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingWigdet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitCircle(
        color: Colors.black,
        size: 50.0,
      ),
    );
  }
}
