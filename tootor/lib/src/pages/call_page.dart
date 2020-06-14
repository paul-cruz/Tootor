import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';


class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

  double _fontSize = 20;
  double _instructionFont = 15;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Entrevista en curso")),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
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
                Expanded(flex: 1 ,child: Text("Name", style: TextStyle(fontSize: 20),)),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Name se encuentra aplicando la entrevista",
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
                      Column(
                        children: [
                          RawMaterialButton(
                            onPressed: (){
                              //TODO: Altavoz
                              print("Altavoz");
                            },
                            fillColor: CustomColors.secondary,
                            child: Icon(
                              Icons.volume_up,
                              size: 50,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10),
                            shape: CircleBorder(),
                          ),
                          Text(
                            "Altavoz",
                            style: TextStyle(
                                fontSize: this._instructionFont
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RawMaterialButton(
                            onPressed: (){
                              //TODO: Mute
                              print("Mute");
                            },
                            fillColor: Colors.grey[700],
                            child: Icon(
                              Icons.mic_off,
                              size: 50,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10),
                            shape: CircleBorder(),
                          ),
                          Text(
                            "Silenciar",
                            style: TextStyle(
                                fontSize: this._instructionFont
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RawMaterialButton(
                            onPressed: (){
                              //TODO: Finished
                              print("Finished");
                            },
                            fillColor: CustomColors.red,
                            child: Icon(
                              Icons.phone,
                              size: 50,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10),
                            shape: CircleBorder(),
                          ),
                          Text(
                            "Finalizar",
                            style: TextStyle(
                                fontSize: this._instructionFont
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}

