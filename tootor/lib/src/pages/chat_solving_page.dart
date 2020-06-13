import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class ChatSolving extends StatelessWidget {
  String name;
  String role;
  double _fontSize;
  ChatSolving({this.name, this.role}){
    this._fontSize = 20;
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Resolviendo duda")),
      ),

      body: ListView(
        children: [
          Container(
          padding: EdgeInsets.all(0.0),
          child:Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: CustomColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: CustomColors.gray,
                      radius: widthScreen-330,
                      child: Container(
                        margin: EdgeInsets.all(10),
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
                    Text(
                      "${this.role} ${this.name}",
                      style: TextStyle(
                          fontSize: this._fontSize-5,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: ClipOval(
                        child: Material(
                          color: CustomColors.primary, // button color
                          child: InkWell(
                            splashColor: CustomColors.secondary, // inkwell color
                            child: SizedBox(width: 56, height: 56, child: Icon(Icons.check, color: Colors.white,)),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
              Container(
                height: heightScreen-220,
              ),
              Container(
                color: CustomColors.primary,
                height: heightScreen-600,
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt, color: CustomColors.secondary, size: widthScreen-320),
                    SizedBox(width: widthScreen-340,),
                    Container(
                      width: widthScreen-100,
                      child: TextFormField(
                        autocorrect: false,
                        decoration: InputDecoration(hintText: 'Enviar mensaje', fillColor: Colors.white, filled: true),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]
      ),
    );
  }
}
