import 'package:tootor/src/utils/customized_colors.dart';
import 'package:flutter/material.dart';

class HabilityCard extends StatelessWidget {
  String subject;
  double _fontSize;
  String url;
  HabilityCard({this.subject, this.url}){
    this._fontSize = 20;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 40 / 10,
            child: Container(
              padding: EdgeInsets.only(bottom: 0),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: new NetworkImage(this.url),
                  )
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                color: CustomColors.secondary,
                child: Text(
                  this.subject,
                  style: TextStyle(
                    fontSize: this._fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}