import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _descriptionFocus = FocusNode();
  final _imageController = TextEditingController();
  final _imageFocus = FocusNode();
  final _priceFocus = FocusNode();

  @override
  void initState() {
    _imageFocus.addListener(_updateImageUrl);

    super.initState();
  }

  @override
  void dispose() {
    _descriptionFocus.dispose();
    _imageFocus.removeListener(_updateImageUrl);
    _imageFocus.dispose();
    _priceFocus.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageFocus.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocus);
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                  focusNode: _priceFocus,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  focusNode: _descriptionFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 100,
                        child: _imageController.text.isEmpty
                            ? Text('Insert a URL')
                            : Image.network(
                                _imageController.text,
                                fit: BoxFit.cover,
                              ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        margin: EdgeInsets.only(right: 10, top: 15),
                        width: 100,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _imageController,
                          decoration: InputDecoration(
                            labelText: 'Image URL',
                          ),
                          focusNode: _imageFocus,
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ),
              ],
            ),
          ),
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
