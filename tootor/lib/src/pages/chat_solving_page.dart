import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatSolving extends StatefulWidget {
  static const String id = "CHAT";
  final FirebaseUser user;
  String role;
  String name;
  ChatSolving({Key key, this.user, this.role, this.name}): super(key:key);
  @override
  _ChatSolvingState createState() => _ChatSolvingState();
}

class _ChatSolvingState extends State<ChatSolving> {

  final Firestore _firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  double _fontSize = 15;
  String userEmail;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback() async{
    if(messageController.text.length>0){
      String userEmail;
      final user =
      await _auth.currentUser().then((value) => userEmail = value.email);
      _firestore.collection('messages').add({
        'text' : messageController.text,
        'from' : userEmail,
      });
      messageController.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent, curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
    }
  }

  Future<String> getCurrentEmail() async{
    final user =
    await _auth.currentUser().then((value) => this.userEmail = value.email);
    this.userEmail;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentEmail();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Resolviendo duda")),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
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
                "Resolviendo duda",
                style: TextStyle(
                    fontSize: this._fontSize-2,
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
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('messages').snapshots(),
                    builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot){
                      if(!snapshot.hasData) return Center( child:CircularProgressIndicator());

                      List<DocumentSnapshot> docs = snapshot.data.documents;

                      List <Widget> messages = docs.map((doc) => Message(from: doc.data['from'], text: doc.data['text'], me: doc.data['from']==this.userEmail,),).toList();
                      return ListView(
                        controller: scrollController,
                        children: <Widget>[
                          ... messages,
                        ],
                      );
                    },
                  )
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        decoration: InputDecoration(
                          hintText: 'Escribe un mensaje',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SendButton(
                      text: 'Send',
                      callback: callback,
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

class SendButton extends StatelessWidget{
  final String text;
  final VoidCallback callback;
  const SendButton({Key key, this.text, this.callback}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      padding: EdgeInsets.all(20),
      onPressed: callback,
      shape: CircleBorder(),
      child: Text(text),
    );
  }
}


class Message extends StatelessWidget {
  final String from;
  final String text;

  final bool me;

  const Message({Key key, this.from, this.text, this.me}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            from,
            style: TextStyle(fontSize: 10),
          ),
          Material(
            color: me ? CustomColors.primary : CustomColors.secondary,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(text, style: TextStyle(color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
