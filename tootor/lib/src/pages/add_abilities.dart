import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/select_hability_page.dart';
class AddAbilities extends StatefulWidget {
  @override

  _AddAbilitiesState createState() => _AddAbilitiesState();
}

class _AddAbilitiesState extends State<AddAbilities> {

  double _fontSize = 18;
  List<Widget> _abilities = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Selecciona tus habilidades")),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Text(
                  "Aquí seleccionaras las materias en las que crees tener las habilidades para ayudar a otros usuarios",
                  style: TextStyle(
                    fontSize: this._fontSize,
                  ),
                  textAlign: TextAlign.center,
                )
            ),
            Expanded(
              flex: 2,
              child: ListView(
                children:[
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: this._abilities.map((content){
                    return content;
                  }).toList(),
                ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: CustomColors.secondary,),
                ),
                child: Column(
                  children: <Widget>[
                    Text("Presiona para agregar una materia.", textAlign: TextAlign.center, style: TextStyle(fontSize: this._fontSize),),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: (){
                          //TODO: Open camera
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SelectHabilityPage(onSelectedHability: (materia){
                            setState(() {
                              _abilities.add(materia);
                            });
                          },)));
                        },
                        child: CircleAvatar(
                            backgroundColor: CustomColors.secondary,
                            radius: 30,
                            child: Icon(
                              Icons.add,
                              size: 40,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton(
                    child: Text("Cancelar"),
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                  FlatButton(
                    onPressed: this._abilities.length>0?(){
                      //TODO: save list
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/signup/end');
                    }:null,
                    child: Text("Finalizar", style: TextStyle(color: Colors.white),),
                    color: CustomColors.secondary,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
