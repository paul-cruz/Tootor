import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
class SelectHabilityPage extends StatelessWidget{
  double _fontSize;
  Function onSelectedHability;

  SelectHabilityPage({this.onSelectedHability}){
    this._fontSize = 20;
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Elige las materias")),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    this.onSelectedHability("Algebra lineal");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 40 / 10,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0),
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: new NetworkImage('https://aeac.science/wp-content/uploads/2020/01/matematicas.jpg'),
                                )
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              color: CustomColors.secondary,
                              child: Text(
                                "Algebra lineal",
                                style: TextStyle(
                                  fontSize: this._fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    this.onSelectedHability("Algebra lineal");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 40 / 10,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0),
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: new NetworkImage('https://content.gnoss.ws/imagenes/Usuarios/ImagenesCKEditor/e39dea24-3293-4ccc-971a-48f63fc6c932/d8cd4256-381f-410c-8923-47267ce3be3d.jpg'),
                                )
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              color: CustomColors.secondary,
                              child: Text(
                                "Diseño de sistemas digitales",
                                style: TextStyle(
                                  fontSize: this._fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    this.onSelectedHability("Algebra lineal");
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 40 / 10,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0),
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: new NetworkImage('https://api.ed.team/public-files/bloginlineimg/b4ab5d6e-2940-4ad0-b3d0-e189064901fc.png'),
                                )
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              color: CustomColors.secondary,
                              child: Text(
                                "Programación orientada a objetos",
                                style: TextStyle(
                                  fontSize: this._fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // TODO: get subjects from DB
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          borderSide: BorderSide(
              color: CustomColors.font_gray,
              width: 1.0
          ),
          child: Text(
            'Cancelar',
            style: TextStyle(
                fontSize: this._fontSize-5,
                color: CustomColors.font_gray
            ),
          ),
        )
      ],
    );
  }

}