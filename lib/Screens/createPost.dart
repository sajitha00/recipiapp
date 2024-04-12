import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? _image; // Make _image nullable
  String _caption = '';
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadImage() async {
    if (_image == null) return; // No need to check for null here

    String fileName = _image!.path.split('/').last;
    Reference ref = FirebaseStorage.instance.ref().child("posts/$fileName");
    UploadTask uploadTask = ref.putFile(_image!);

    await uploadTask.whenComplete(() async {
      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('posts').add({
        'caption': _caption,
        'imageUrl': url,
      });
      setState(() {
        _image = null;
        _caption = '';
      });
      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your post has been successfully created.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Column(
        children: <Widget>[
          _image == null
              ? const Text('No image selected.')
              : Image.file(_image!),
          TextField(
            onChanged: (value) {
              setState(() {
                _caption = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Caption',
            ),
          ),
          ElevatedButton(
            onPressed: getImage,
            child: const Text('Select Image'),
          ),
          ElevatedButton(
            onPressed: uploadImage,
            child: const Text('Upload Post'),
          ),
        ],
      ),
    );
  }
}
