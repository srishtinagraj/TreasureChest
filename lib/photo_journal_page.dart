import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoJournalPage extends StatefulWidget {
  const PhotoJournalPage({Key? key}) : super(key: key);

  @override
  _PhotoJournalPageState createState() => _PhotoJournalPageState();
}

class _PhotoJournalPageState extends State<PhotoJournalPage> {
  String? _location;
  File? _image;

  final TextEditingController _textController = TextEditingController();
  
  get maxHeight => null;

  Future<void> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: maxHeight * 0.6,
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
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
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
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Start writing here...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 6,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
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
                padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
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
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/check_icon.png',
                        width: maxWidth * 0.3,
                        height: maxWidth * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.grey,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
