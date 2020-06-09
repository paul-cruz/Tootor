import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class SearchingTootorPage extends StatelessWidget{
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
                Text("Buscando usuarios con las habilidades necesarias para ayudarte con tu duda.", style: TextStyle(fontSize: width-345)),
                SizedBox(height: 20,),
                Text("Esto puede tardar un poco.", )
              ],
            ),
            Row(
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
                  child: Text('Cancelar', style: TextStyle(fontSize: 20, color: CustomColors.font_gray),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}