import 'dart:io';

import 'package:flutter/material.dart';
import 'package:treasurechst/screens/photo_journal_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  final List<FeedItem> _feedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: ListView(
        children: [
          // First set of containers

          // Second set of containers
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: Text('RH Miami'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset('assets/food_pic.jpeg'),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Sunday brunch in uptown Miami'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
