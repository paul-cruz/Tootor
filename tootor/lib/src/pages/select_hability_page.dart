import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/behaviors/hiddenScrollBehovior.dart';
import 'package:tootor/src/widgets/hability_card.dart';

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
                    this.onSelectedHability(HabilityCard(subject: 'Algebra lineal', url: 'https://aeac.science/wp-content/uploads/2020/01/matematicas.jpg'));
                    Navigator.of(context).pop();
                  },
                  child: HabilityCard(subject: 'Algebra lineal', url: 'https://aeac.science/wp-content/uploads/2020/01/matematicas.jpg')
                ),
                GestureDetector(
                  onTap: (){
                    this.onSelectedHability(HabilityCard(subject: 'Diseño de sistemas digitales', url: 'https://content.gnoss.ws/imagenes/Usuarios/ImagenesCKEditor/e39dea24-3293-4ccc-971a-48f63fc6c932/d8cd4256-381f-410c-8923-47267ce3be3d.jpg',));
                    Navigator.of(context).pop();
                  },
                  child: HabilityCard(subject: 'Diseño de sistemas digitales', url: 'https://content.gnoss.ws/imagenes/Usuarios/ImagenesCKEditor/e39dea24-3293-4ccc-971a-48f63fc6c932/d8cd4256-381f-410c-8923-47267ce3be3d.jpg',)
                ),
                GestureDetector(
                  onTap: (){
                    this.onSelectedHability(HabilityCard(subject: 'Programación orientada a objetos', url: 'https://api.ed.team/public-files/bloginlineimg/b4ab5d6e-2940-4ad0-b3d0-e189064901fc.png',));
                    Navigator.of(context).pop();
                  },
                  child: HabilityCard(subject: 'Programación orientada a objetos', url: 'https://api.ed.team/public-files/bloginlineimg/b4ab5d6e-2940-4ad0-b3d0-e189064901fc.png',),
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