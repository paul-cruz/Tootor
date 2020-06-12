import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class HelpRequestedPage extends StatelessWidget {

  String name;
  HelpRequestedPage({this.name});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Ayuda solicitada")),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, heightScreen-650, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CustomColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: CustomColors.gray,
                    radius: widthScreen-320,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/smile.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text("${this.name} requiere \nayuda con el \nsiguiente problema",
                    style: TextStyle(fontSize: widthScreen-345, color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            SizedBox(height: heightScreen-630,),
            Text("Problema:",
              style: TextStyle(color: CustomColors.font_gray, fontSize: widthScreen-345),
              textAlign:  TextAlign.start,
            ),
            SizedBox(height: heightScreen-650,),
            Center(
              child: Image(
                width: widthScreen-150,
                image: AssetImage('assets/smile.png'),
              ),
            ),
            SizedBox(height: heightScreen-630,),
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
                  child: Text('Rechazar', style: TextStyle(fontSize: widthScreen-345, color: CustomColors.font_gray),),
                ),
                FlatButton(
                  onPressed: () {

                  },
                  color: CustomColors.secondary,
                  child: Text('¡Vamos!', style: TextStyle(fontSize: widthScreen-345, color: Colors.white),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
