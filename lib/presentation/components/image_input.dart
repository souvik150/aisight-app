import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';

class ImageInput extends StatefulWidget {
  final Function(File pickedImage) onImagePicked;

  ImageInput(this.onImagePicked);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _imageFile;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _imageFile = File(imageFile.path);
    });
    widget.onImagePicked(_imageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Center(
                  child: Text(
                    'No Image Taken',
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50
              ),
              child: ElevatedButton(
                onPressed: _getImage,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                  backgroundColor: appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Take Image",
                  style: TextStyle(color: bgColor, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30
              ),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).pushNamed('/analysis')
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 15),
                  backgroundColor: appBarColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Send Image",
                  style: TextStyle(color: bgColor, fontSize: 18),

                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
