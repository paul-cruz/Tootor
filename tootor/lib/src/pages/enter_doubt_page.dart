import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:tootor/src/pages/select_subject_page.dart';
class EnterDoubtPage extends StatefulWidget {
  @override
  _EnterDoubtPageState createState() => _EnterDoubtPageState();
}

class _EnterDoubtPageState extends State<EnterDoubtPage> {

  String _topic;
  String _description;
  String _subject;

  @override
  void initState(){
    this._subject = "Selecciona una materia";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: ListView(
              children:[
                Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(
                    height: 1,
                    color: CustomColors.divider_gray,
                  ),
                  SizedBox(height: heightScreen-660,),
                  GestureDetector(
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
                          Text("${this._subject}", style: TextStyle(fontSize: width-340),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: width-330,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: heightScreen-660,),
                  Divider(
                    height: 1,
                    color: CustomColors.divider_gray,
                  ),
                  SizedBox(height: heightScreen-660,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(hintText: 'Escribe el tema en especifico'),
                    onChanged: (value) => {setState((){this._topic = value;})},
                  ),
                  SizedBox(height: heightScreen-660,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(hintText: 'Escribe el problema a resolver'),
                    maxLines: 2,
                    onChanged: (value) => {setState((){this._description = value;})},
                  ),
                  SizedBox(height: heightScreen-660,),
                  Text("O introduce una foto con el problema a resolver", style: TextStyle(fontSize: width-347), textAlign: TextAlign.center,),
                  SizedBox(height: heightScreen-660,),
                  GestureDetector(
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
                  SizedBox(height: heightScreen-630,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: (){
                          //TODO: Upload Subject, topic and description or image
                        },
                        color: CustomColors.secondary,
                        child: Text("¡Buscar Tutor!", style: TextStyle(fontSize: width-345, color: Colors.white),),
                      ),

                    ],
                  )
                ],
              ),
            ]
            ),
          )
      );
  }
}

