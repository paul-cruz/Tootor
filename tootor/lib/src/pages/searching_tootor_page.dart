import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/index.dart';
import 'package:tootor/src/pages/chat_solving_page.dart';
class SearchingTootorPage extends StatefulWidget{

  String funcion;
  double _fontSize;
  bool wait;
  SearchingTootorPage({this.funcion}){
    this._fontSize = 20;
    wait=true;
  }

  @override
  _SearchingTootorPageState createState() => _SearchingTootorPageState();
}

class _SearchingTootorPageState extends State<SearchingTootorPage> {
  Future<void> tempo(context) async{
    await Future.delayed(Duration(seconds: 3));
    if(widget.wait) {
      if (this.widget.funcion == "ayudarte por chat") {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ChatSolving()));
      } else
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => IndexPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    tempo(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Buscando Tutor")),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  backgroundColor: CustomColors.gray,
                  radius: 90,
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
                flex: 2,
                child: Text(
                    "Buscando usuarios con las habilidades necesarias para ${this.widget.funcion}.",
                    style: TextStyle(
                        fontSize: this.widget._fontSize
                    )
                ),
              ),
              Expanded(flex: 2, child: Text("Esto puede tardar un poco.", )),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          widget.wait = false;
                        });
                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                      borderSide: BorderSide(
                          color: CustomColors.font_gray,
                          width: 1.0
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                            fontSize: this.widget._fontSize,
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
      ),
    );
  }
}