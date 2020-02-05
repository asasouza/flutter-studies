import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/products.dart';

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
  final _form = GlobalKey<FormState>();

  var _firstBuild = true;
  var _isLoading = false;

  var product = Product(
    id: null,
    description: '',
    imageUrl: '',
    price: 0,
    title: '',
  );

  @override
  void initState() {
    _imageFocus.addListener(_updateImageUrl);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_firstBuild) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        product = Provider.of<Products>(
          context,
          listen: false,
        ).findById(productId);
        _imageController.text = product.imageUrl;
      }
    }
    _firstBuild = false;
    super.didChangeDependencies();
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

  void _onSubmit() {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    final products = Provider.of<Products>(
      context,
      listen: false,
    );
    setState(() {
      _isLoading = true;
    });
    if (product.id == null) {
      products.addNewItem(product).catchError((_) {
        return showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                actions: <Widget>[
                  FlatButton(
                    child: Text('Okay'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
                content: Text('Something went wrong!'),
              );
            });
      }).then((_) {
        Navigator.of(context).pop();
        setState(() {
          _isLoading = false;
        });
      });
    } else {
      products
          .updateItem(
        product.id,
        product,
      )
          .then((_) {
        Navigator.of(context).pop();
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _onSubmit,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        initialValue: product.title,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocus);
                        },
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          product = Product(
                            id: product.id,
                            description: product.description,
                            imageUrl: product.imageUrl,
                            isFavorite: product.isFavorite,
                            price: product.price,
                            title: value,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Price',
                        ),
                        focusNode: _priceFocus,
                        initialValue: product.price.toString(),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          product = Product(
                            id: product.id,
                            description: product.description,
                            imageUrl: product.imageUrl,
                            isFavorite: product.isFavorite,
                            price: double.parse(value),
                            title: product.title,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a price';
                          }
                          if (double.tryParse(value) == null ||
                              double.parse(value) <= 0) {
                            return 'Please enter a valid price';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        focusNode: _descriptionFocus,
                        initialValue: product.description,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onSaved: (value) {
                          product = Product(
                            id: product.id,
                            description: value,
                            imageUrl: product.imageUrl,
                            isFavorite: product.isFavorite,
                            price: product.price,
                            title: product.title,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty || value.length < 10) {
                            return 'Please enter a description with at least 10 characters';
                          }
                          return null;
                        },
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
                                onFieldSubmitted: (_) {
                                  _onSubmit();
                                },
                                onSaved: (value) {
                                  product = Product(
                                    id: product.id,
                                    description: product.description,
                                    imageUrl: value,
                                    isFavorite: product.isFavorite,
                                    price: product.price,
                                    title: product.title,
                                  );
                                },
                                textInputAction: TextInputAction.done,
                                validator: (value) {
                                  if (value.isEmpty ||
                                      (!value.startsWith('http') &&
                                          !value.startsWith('https'))) {
                                    return 'Please provide a valid image URL';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                      ),
                    ],
                  ),
                ),
                key: _form,
              ),
              padding: EdgeInsets.all(16),
            ),
    );
  }
}
