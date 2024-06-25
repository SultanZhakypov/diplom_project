import 'package:dimplom/screens/homescreen/data/model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.topJopa, {super.key});
  final HomeModelTopics topJopa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topJopa.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              topJopa.category,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingBottomArea extends StatelessWidget {
  const FloatingBottomArea({
    super.key,
    required this.child,
    required this.areaContent,
  });
  final Widget child;
  final Widget areaContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: child), areaContent],
    );
  }
}
