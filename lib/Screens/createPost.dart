import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:recipiapp/components/bottomNavigation.dart';

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
    return ScaffoldGradientBackground(
      bottomNavigationBar: SizedBox(height:70,child: BottomMainNavigationBar()),
      gradient:LinearGradient(
        colors: [
          Color(0xFF444141), // #444141
          Color(0xFF1D1C1C), // #1D1C1C
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor:Color(0xFFD77E15),
        title: Text(
          "Create Post",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            fontFamily: 'Poppins',
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              _image == null
                  ? const Text('No image selected.',style: TextStyle(
                fontSize: 14,
                fontFamily: "Poppins",
                color: Colors.white
              ),)
                  : Image.file(_image!),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _caption = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Caption',
                  labelStyle: TextStyle(
                    color: Colors.white38,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: "Poppins"
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: getImage,
                child: const Text('Select Image',style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600,
                ),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD77E15)
                ),
              ),
              SizedBox(height: 5,),
              ElevatedButton(
                onPressed: uploadImage,
                child: const Text('Upload Post',style: TextStyle(
                  fontFamily: "Poppins",
                  color: Color(0xFFFFFFFF),
                  fontWeight:FontWeight.w600,
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD77E15)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
