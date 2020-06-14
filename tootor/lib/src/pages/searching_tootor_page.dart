import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SearchingTootorPage extends StatelessWidget{

  String funcion;
  double _fontSize;
  SearchingTootorPage({this.funcion}){
    this._fontSize = 20;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Buscando Tutor")),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, height-650, 20, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
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
                  Expanded(
                    flex: 2,
                    child: Text(
                        "Buscando usuarios con las habilidades necesarias para ${this.funcion}.",
                        style: TextStyle(
                            fontSize: this._fontSize
                        )
                    ),
                  ),
                  Expanded(flex: 1,child: Text("Esto puede tardar un poco.", ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}