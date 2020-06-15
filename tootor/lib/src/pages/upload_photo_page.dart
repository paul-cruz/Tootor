import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class UploadImagePage extends StatefulWidget {
  UploadImagePage({Key key}) : super(key: key);

  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File _file;

  void _choose() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _file = File(pickedFile.path);
    });
  }

  _continue() {
    Navigator.of(context).pushNamed('/askaddabilities');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elige una foto de pefil'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              width: 250.0,
              height: 250.0,
              child: RawMaterialButton(
                shape: CircleBorder(),
                fillColor: CustomColors.secondary,
                elevation: 10.0,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: 200.0,
                ),
                onPressed: _choose,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  child: RaisedButton(
                    splashColor: CustomColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: _continue,
                    textColor: Colors.black,
                    color: CustomColors.light_gray,
                    child: const Text('Omitr', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                ),
                ButtonTheme(
                  child: RaisedButton(
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: _continue,
                    textColor: Colors.white,
                    color: CustomColors.secondary,
                    child: const Text('Ok', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),

          /*file == null
              ? Text('No Image Selected') 
              : Image.file(file)*/
        ],
      ),
    );
  }
}
