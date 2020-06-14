import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {

  List<Color> _starColors = new List(5);
  List<IconData> _starIcon = new List(5);
  int _stars;
  double _fontSize=18;

  @override
  void initState(){
    super.initState();
    this._stars = -1;
    for(int i = 0 ; i < 5 ; i++){
      this._starColors[i] = Colors.black;
    }

    for(int i = 0 ; i < 5 ; i++){
      this._starIcon[i] = Icons.star_border;
    }
  }

  _changeStarColor(int index){
    List<Color> newColors = List(5);
    List<IconData> newShape = List(5);
    for(int i = 0 ; i < 5 ; i++){
      newColors[i] = Colors.black;
      newShape[i] = Icons.star_border;
    }

    for(int i = 0 ; i <= index ; i++){
      newColors[i] = Colors.yellow;
      newShape[i] = Icons.star;
    }

    setState(() {
      _starColors = newColors;
      _starIcon = newShape;
      _stars = index+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Evalua a tu Tutor")),
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
                    radius: width-290,
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
                  flex: 1,
                  child: Text(
                    "Name",
                    style: TextStyle(
                        fontSize: this._fontSize
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "Por favor evalua la ayuda brindada con tu problema",
                    style: TextStyle(
                        fontSize: this._fontSize
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap:(){
                          this._changeStarColor(0);
                        },
                        child: Icon(
                          this._starIcon[0],
                          size: width-300,
                          color: this._starColors[0],
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          this._changeStarColor(1);
                        },
                        child: Icon(
                          this._starIcon[1],
                          size: width-300,
                          color: this._starColors[1],
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          this._changeStarColor(2);
                        },
                        child: Icon(
                          this._starIcon[2],
                          size: width-300,
                          color: this._starColors[2],
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          this._changeStarColor(3);
                        },
                        child: Icon(
                          this._starIcon[3],
                          size: width-300,
                          color: this._starColors[3],
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          this._changeStarColor(4);
                        },
                        child: Icon(
                          this._starIcon[4],
                          size: width-300,
                          color: this._starColors[4],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: this._stars == -1 ? null : (){print("Evaluado");Navigator.of(context).pushReplacementNamed('/home');},
                      color: CustomColors.secondary,
                      child: Text(
                        "Aceptar",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
