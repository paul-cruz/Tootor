import 'package:flutter/material.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SelectSubjectPage extends StatelessWidget{
  final Function onSubjectSelected;
  double _fontSize;

  SelectSubjectPage({this.onSubjectSelected}){
    this._fontSize = 15;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Selecciona la materia")),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            child: ListView(
              children: <Widget>[
                Divider(
                  height: 5,
                  color: CustomColors.divider_gray,
                ),
                GestureDetector(
                  onTap: (){
                    this.onSubjectSelected("Algebra lineal");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Algebra Lineal",
                      style: TextStyle(
                          fontFamily: 'SocialIcons',
                          fontSize: this._fontSize,
                          color: CustomColors.font_gray
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  color: CustomColors.divider_gray,
                ),
                GestureDetector(
                  onTap: (){
                    this.onSubjectSelected("Teoria computacional");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Teoria Computacional",
                      style: TextStyle(
                          fontFamily: 'SocialIcons',
                          fontSize: this._fontSize,
                          color: CustomColors.font_gray
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  color: CustomColors.divider_gray,
                ),
                GestureDetector(
                  onTap: (){
                    this.onSubjectSelected("Sistemas digitales");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Sistemas digitales",
                      style: TextStyle(
                          fontFamily: 'SocialIcons',
                          fontSize: this._fontSize,
                          color: CustomColors.font_gray
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  color: CustomColors.divider_gray,
                ),
                // TODO: get subjects from DB
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          borderSide: BorderSide(
            color: CustomColors.font_gray,
            width: 1.0
          ),
          child: Text(
            'Cancelar',
            style: TextStyle(
                fontSize: this._fontSize+2,
                color: CustomColors.font_gray
            ),
          ),
        )
      ],
    );
  }
}