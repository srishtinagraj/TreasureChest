import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'feed_page.dart';

class PhotoJournalPage extends StatefulWidget {
  const PhotoJournalPage({Key? key}) : super(key: key);

  @override
  _PhotoJournalPageState createState() => _PhotoJournalPageState();
}
 
class _PhotoJournalPageState extends State<PhotoJournalPage> {

  String? _location;
  File? _image;
  String? _journalText;



  final TextEditingController _textController = TextEditingController();
  final TextEditingController _journalTextController = TextEditingController();

  Future<void> getImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  });
}

  @override
  void dispose() {
    _textController.dispose();
    _journalTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: maxWidth * 0.3,
                  width: double.infinity,
                  child: _image != null
                      ? kIsWeb
                          ? Image.network(_image!.path, fit: BoxFit.cover)
                          : Image.file(_image!, fit: BoxFit.cover)
                      : Image.asset(
                          'assets/sample_image.jpg',
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.01),
                  child: const Text(
                    'Write your journal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.01),
                  child: TextField(
                    controller: _journalTextController,
                    decoration: const InputDecoration(
                      hintText: 'Start writing here...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 6,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.01),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          onChanged: (value) {
                            setState(() {
                              _location = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Where was the photo taken?',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          'assets/filter_logo.png',
                          width: maxWidth * 0.3,
                          height: maxWidth * 0.3,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          getImage();
                        },
                        child: Image.asset(
                          'assets/add_image_icon.png',
                          width: maxWidth * 0.3,
                          height: maxWidth * 0.3,
                        ),
                      ),
                      GestureDetector(
                          onDoubleTap: () {
                            _journalText = _journalTextController.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeedPage(
                                  image: _image,
                                  journalText: _journalText ?? 'Start writing here...',
                                  location: _location ?? 'Where was this photo taken?',
                                ),
                              ),
                            );
                          },
                      child: TextButton(
                        onPressed: () {},
                        child: Image.asset(
                          'assets/check_icon.png',
                          width: maxWidth * 0.3,
                          height: maxWidth * 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
