import 'dart:io';

import 'package:flutter/material.dart';

import 'gallery_screen.dart';

class PhotoScreen extends StatelessWidget {
  final File file;

  const PhotoScreen({super.key, required this.file});

  _deleteFile(BuildContext context) async{
    await this.file.delete();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GalleryScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(file.path.split('/').last)),
      body: Column(
        children: [
          Hero(tag: file.path, child: Image.file(file)),
          OutlinedButton(
            onPressed: () => _deleteFile(context),
            child: Text("Ranged weapon"),
          ),
        ],
      ),
    );
  }
}
