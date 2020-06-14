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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Resolviendo duda")),
      ),

      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CustomColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: CustomColors.gray,
                    radius: 30,
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
                  Text(
                    "${this.role} ${this.name}",
                    style: TextStyle(
                        fontSize: this._fontSize-5,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.start,
                  ),
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
                            Navigator.of(context).pushReplacementNamed('/evaluation');
                          },
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(

            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: CustomColors.primary,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.camera_alt, color: CustomColors.secondary, size: 30),
                  Container(
                    width: 300,
                    child: TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(hintText: 'Enviar mensaje', fillColor: Colors.white, filled: true),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

