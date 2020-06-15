import 'package:flutter/material.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class QuizData {
  String title;
  List quiz;

  QuizData({this.title, this.quiz});
}

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  ScrollController _controller;
  double _itemSize = 100.0;
  String _next = 'Siguiente', _back = 'Cancelar';
  int _numQuestions = 0, _controlerQuiz = 0;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  _moveNext() {
    if (_next == "Finalizar") {
      Navigator.of(context).popUntil(ModalRoute.withName('/test/detail'));
    }

    if (_controlerQuiz < _numQuestions - 1) {
      setState(() {
        _controlerQuiz++;
      });
    }
    if (_controlerQuiz == 0) {
      setState(() {
        _next = "Siguiente";
      });
    } else if (_controlerQuiz == _numQuestions - 1) {
      setState(() {
        _next = "Finalizar";
      });
    }
    if (_controlerQuiz > 0) {
      setState(() {
        _back = "Anterior";
      });
    }
    _controller.animateTo(_controller.offset + _itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 300));
  }

  _moveBack() {
    if (_back == "Cancelar") {
      Navigator.of(context).popUntil(ModalRoute.withName('/test/detail'));
    }

    if (_controlerQuiz > 0) {
      setState(() {
        _controlerQuiz--;
      });
    }
    if (_controlerQuiz == 0) {
      setState(() {
        _back = "Cancelar";
      });
    } else if (_controlerQuiz > 0) {
      setState(() {
        _back = "Anterior";
      });
    }
    _controller.animateTo(_controller.offset - _itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 300));
  }

  List<Widget> _builAnswerList(Map data) {
    final List<Widget> options = [];
    data.forEach((key, value) {
      if (key.startsWith('Answer')) {
        final tempWidget = Padding(
          padding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
          child: ButtonTheme(
            padding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
            minWidth: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
              onPressed: () {},
              textColor: Colors.white,
              color: CustomColors.secondary,
              child: Text(
                value,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
        options..add(tempWidget);
      }
    });
    return options;
  }

  Widget _buildCard(Map item, double _left, double _right) {
    return Container(
      margin:
          EdgeInsets.only(top: 50.0, right: _right, left: _left, bottom: 50.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(item['question']),
                    ),
                  ],
                ),
              ),
              item['image'] != null
                  ? Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          FadeInImage(
                            placeholder: AssetImage('assets/loading.gif'),
                            image: NetworkImage(item['image']),
                            fadeInDuration: Duration(milliseconds: 200),
                            fit: BoxFit.cover,
                            height: 100.0,
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _builAnswerList(item),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardListView(_quiz) {
    setState(() {
      _numQuestions = _quiz.length;
    });
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: _quiz.length,
        itemExtent: MediaQuery.of(context).size.width - 20.0,
        //padding: EdgeInsets.all(50.0),
        itemBuilder: (context, index) {
          var item = _quiz[index];
          if (index == 0) {
            return _buildCard(item, 50.0, 25.0);
          } else if (index == _quiz.length - 1) {
            return _buildCard(item, 25.0, 50.0);
          } else {
            return _buildCard(item, 25.0, 25.0);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _itemSize = MediaQuery.of(context).size.width - 20.0;
    });
    final QuizData data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildCardListView(data.quiz)),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 150.0,
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    splashColor: CustomColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: () {
                      _moveBack();
                    },
                    textColor: Colors.black,
                    color: CustomColors.light_gray,
                    child: Text(_back, style: TextStyle(fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ButtonTheme(
                  minWidth: 150.0,
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    splashColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: () {
                      _moveNext();
                    },
                    textColor: Colors.white,
                    color: CustomColors.secondary,
                    child: Text(_next, style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
