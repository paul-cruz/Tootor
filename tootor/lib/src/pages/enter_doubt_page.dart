import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/select_subject_page.dart';
import 'package:tootor/src/pages/searching_tootor_page.dart';
class EnterDoubtPage extends StatefulWidget {
  @override
  _EnterDoubtPageState createState() => _EnterDoubtPageState();
}

class _EnterDoubtPageState extends State<EnterDoubtPage> {

  String _topic;
  String _description;
  String _subject;
  double _fontSize = 20;

  @override
  void initState(){
    this._subject = "Selecciona una materia";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                height: 1,
                color: CustomColors.divider_gray,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    print("Select subject");
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SelectSubjectPage(onSubjectSelected: (materia){setState(() {
                      _subject = materia;
                    });
                    print(this._subject);
                    },)));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${this._subject}",
                          style: TextStyle(
                              fontSize: this._fontSize
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: CustomColors.divider_gray,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(hintText: 'Escribe el tema en especifico'),
                  onChanged: (value) => {setState((){this._topic = value;})},
                ),
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(hintText: 'Escribe el problema a resolver'),
                  maxLines: 2,
                  onChanged: (value) => {setState((){this._description = value;})},
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "O introduce una foto con el problema a resolver",
                  style: TextStyle(
                      fontSize: this._fontSize-5
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: (){
                    //TODO: Open camera
                    print("Camera");
                  },
                  child: CircleAvatar(
                    backgroundColor: CustomColors.secondary,
                    radius: width-300,
                    child: Icon(
                      Icons.camera_alt,
                      size: width-280,
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: this._subject!="Selecciona una materia" ?(){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>SearchingTootorPage(funcion: 'aplicarte una entrevista',)));}:null,
                      color: CustomColors.secondary,
                      child: Text(
                        "¡Buscar Entrevista!",
                        style: TextStyle(
                            fontSize: this._fontSize-5,
                            color: Colors.white
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: this._subject!="Selecciona una materia" ?(){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>SearchingTootorPage(funcion: 'ayudarte por chat',)));}: null,
                      color: CustomColors.secondary,
                      child: Text(
                        "¡Buscar Chat!",
                        style: TextStyle(
                            fontSize: this._fontSize-5,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
              ),
          )
      );
  }
}


