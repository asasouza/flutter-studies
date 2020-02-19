import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storagedImage;

  Future<void> _takePicture() async {
    final image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (image == null) {
      return;
    }
    setState(() {
      _storagedImage = image;
    });
    final directory = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final storagedImage = await image.copy('${directory.path}/$filename');
    widget.onSelectImage(storagedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: _storagedImage != null
              ? Image.file(
                  _storagedImage,
                  fit: BoxFit.cover,
                )
              : Text('No Image Taken'),
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(Icons.add_a_photo),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
