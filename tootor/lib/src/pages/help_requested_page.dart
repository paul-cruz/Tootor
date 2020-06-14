import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/chat_solving_page.dart';

class HelpRequestedPage extends StatelessWidget {

  String name;
  double _fontSize;
  HelpRequestedPage({this.name}){
    this._fontSize = 20;
  }

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
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CustomColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Text("${this.name} requiere \nayuda con el \nsiguiente problema",
                      style: TextStyle(
                          fontSize: this._fontSize-2,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("Problema:",
                style: TextStyle(
                    color: CustomColors.font_gray,
                    fontSize:this._fontSize,
                ),
                textAlign:  TextAlign.start,
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Image(
                  width: widthScreen-150,
                  image: AssetImage('assets/smile.png'),
                ),
              ),
            ),
            Expanded(
              flex: 3,
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
                      'Rechazar',
                      style: TextStyle(
                          fontSize: this._fontSize-5,
                          color: CustomColors.font_gray,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatSolving(name: this.name, role: "Ayudando a ",)));
                    },
                    color: CustomColors.secondary,
                    child: Text(
                      '¡Vamos!',
                      style: TextStyle(
                          fontSize: this._fontSize-5,
                          color: Colors.white,
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
