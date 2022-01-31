import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final int pageIndex;

  const PageWidget(this.pageIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PAGE ${pageIndex+1}"),
      ),
    );
  }
}
