import 'dart:io';

import 'package:flutter/material.dart';

class FeedItem {
  final String location;
  final String image;
  final String journalText;

  FeedItem({
    required this.location,
    required this.image,
    required this.journalText,
  });
}

class FeedPage extends StatefulWidget {
  final File? image;
  final String journalText;
  final String location;

  const FeedPage({
    Key? key,
    required this.image,
    required this.journalText,
    required this.location,
  }) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<FeedItem> _feedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: ListView.builder(
        itemCount: _feedItems.length,
        itemBuilder: (BuildContext context, int index) {
          FeedItem item = _feedItems[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: Text(item.location),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.network(item.image),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(item.journalText),
              ),
            ],
          );
        },
      ),
    );
  }
}
