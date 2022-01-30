import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final int page;

  const PageWidget(this.page, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PAGE $page"),
      ),
    );
  }
}
