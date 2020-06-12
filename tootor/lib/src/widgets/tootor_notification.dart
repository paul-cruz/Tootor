import 'package:flutter/material.dart';

class TootorNotification extends StatelessWidget{
  final String name;
  final String subject;
  final String topic;
  TootorNotification({this.name, this.subject, this.topic});

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
              Text("${this.name} tiene una duda y tus \nhabilidades pueden ayudarlo", style: TextStyle(fontSize: width-345)),
              SizedBox(height: 10,),
              Text("Materia: ${this.subject}",style: TextStyle(fontSize: width-350)),
              Text("Tema: ${this.topic}",style: TextStyle(fontSize: width-350 ))
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
          )
        ],
      ),
    );
  }

}