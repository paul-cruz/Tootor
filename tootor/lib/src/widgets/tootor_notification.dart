import 'package:flutter/material.dart';

class TootorNotification extends StatelessWidget{
  final String name;
  final String subject;
  final String topic;
  double _fontSize;
  double _subjectFontSize;
  double _iconSize;

  TootorNotification({this.name, this.subject, this.topic}){
    this._fontSize = 17;
    this._subjectFontSize = 13;
    this._iconSize = 30;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${this.name} tiene una duda y tus \nhabilidades pueden ayudarlo",
                  style: TextStyle(
                      fontSize: this._fontSize,
                  )
              ),
              SizedBox(height: 10,),
              Text("Materia: ${this.subject}",
                  style: TextStyle(
                      fontSize: this._subjectFontSize
                  )
              ),
              Text("Tema: ${this.topic}",
                  style: TextStyle(
                      fontSize: this._subjectFontSize,
                  ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: this._iconSize,
          )
        ],
      ),
    );
  }

}