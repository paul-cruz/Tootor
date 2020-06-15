import 'package:flutter/cupertino.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:flutter/material.dart';

class AskAddAbilities extends StatelessWidget {
  double _fontSize = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Selecciona tus habilidades")),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  "Elige las areas donde puedas ser Tutor.",
                  style: TextStyle(
                    fontSize: this._fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Podras ayudar a otros usuarios \nresolviendo sus dudas en las areas \neducativas en las que tengas habilidades",
                  style: TextStyle(
                    fontSize: this._fontSize,
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FlatButton(
                      color: CustomColors.secondary,
                      child: Text("Agregar", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/addabilities');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      child: Text("Omitir"),
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
