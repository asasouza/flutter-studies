import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storagedImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: _storagedImage != null
              ? Image.file(_storagedImage)
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
            onPressed: () {},
            icon: Icon(Icons.add_a_photo),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
