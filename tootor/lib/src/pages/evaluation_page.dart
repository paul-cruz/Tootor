import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
class EvaluationPage extends StatefulWidget {
  @override
  _EvaluationPageState createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {

  List<Color> starColors = new List(5);
  List<IconData> starIcon = new List(5);
  int stars;

  @override
  void initState(){
    super.initState();
    this.stars = -1;
    for(int i = 0 ; i < 5 ; i++){
      this.starColors[i] = Colors.black;
    }

    for(int i = 0 ; i < 5 ; i++){
      this.starIcon[i] = Icons.star_border;
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
      starColors = newColors;
      starIcon = newShape;
      stars = index+1;
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
                CircleAvatar(
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
                SizedBox(
                  height: 20,
                ),
                Text("Name", style: TextStyle(fontSize: width-335),),
                SizedBox(
                  height: 20,
                ),
                Text("Por favor evalua la ayudad brindada por Name con tu problema", style: TextStyle(fontSize: width-345),textAlign: TextAlign.center,),
                SizedBox(
                  height: heightScreen-600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap:(){
                        this._changeStarColor(0);
                      },
                      child: Icon(
                        this.starIcon[0],
                        size: width-300,
                        color: this.starColors[0],
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        this._changeStarColor(1);
                      },
                      child: Icon(
                        this.starIcon[1],
                        size: width-300,
                        color: this.starColors[1],
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        this._changeStarColor(2);
                      },
                      child: Icon(
                        this.starIcon[2],
                        size: width-300,
                        color: this.starColors[2],
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        this._changeStarColor(3);
                      },
                      child: Icon(
                        this.starIcon[3],
                        size: width-300,
                        color: this.starColors[3],
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        this._changeStarColor(4);
                      },
                      child: Icon(
                        this.starIcon[4],
                        size: width-300,
                        color: this.starColors[4],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(

                      onPressed: this.stars == -1 ? null : (){print("Hola");},

                      color: CustomColors.secondary,
                      child: Text("Aceptar", style: TextStyle(color: Colors.white),),
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
