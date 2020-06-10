import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class TootorFoundPage extends StatelessWidget{
  String funcion;
  TootorFoundPage({this.funcion});
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
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
                SizedBox(height: 20,),
                Text("Name", style: TextStyle(fontSize: width-340)),
                //TODO: Get tutor's name from DB
                SizedBox(height: 20,),
                Text("Encontramos un tutor con las habilidades para ${this.funcion}", style: TextStyle(fontSize: width-345), textAlign: TextAlign.center,),
                SizedBox(height: 20,),
              ],
            ),
            Row(
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
                  child: Text('Cancelar', style: TextStyle(fontSize: 20, color: CustomColors.font_gray),),
                ),
                FlatButton(
                  color: CustomColors.secondary,
                  onPressed: () => {
                    //TODO: go to call
                  },
                  child: Text('¡Vamos!', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}