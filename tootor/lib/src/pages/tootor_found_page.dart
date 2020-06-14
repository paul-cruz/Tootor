import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class TootorFoundPage extends StatelessWidget{
  String _funcion;
  bool interview;
  double _fontSize;

  TootorFoundPage({this.interview}){
    this._fontSize = 20;
    this.interview == true ? this._funcion = "realizar tu entrevista" : this._funcion = "ayudarte con tu duda";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tutor Disponible")),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, height-650, 20, 10),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundColor: CustomColors.gray,
                radius: width-280,
                child: Container(
                  margin: EdgeInsets.all(25),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/smile.png'),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: this._fontSize
                  ),
              ),
            ),
            //TODO: Get tutor's name from DB
            Expanded(
              flex: 1,
              child: Text(
                "Encontramos un tutor con las habilidades para ${this._funcion}",
                style: TextStyle(
                    fontSize: this._fontSize
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                          fontSize: this._fontSize,
                          color: CustomColors.font_gray
                      ),
                    ),
                  ),
                  FlatButton(
                    color: CustomColors.secondary,
                    onPressed: () => {
                      //TODO: go to call
                      if(this.interview!=null){
                        Navigator.of(context).pushReplacementNamed('/call'),
                      } else {
                        Navigator.of(context).pushReplacementNamed('/chatsolving'),
                      }
                    },
                    child: Text(
                      '¡Vamos!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: this._fontSize
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}