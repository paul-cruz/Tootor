import 'package:flutter/material.dart';
import 'package:tootor/src/providers/interview_provider.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class InterviewData {
  String subject;
  List options;

  InterviewData({this.subject, this.options});
}

class InterviewPage extends StatefulWidget {
  InterviewPage({Key key}) : super(key: key);

  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> {
  Widget _buildCard(Map item) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item['image'],
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black26,
                    BlendMode.darken,
                  ),
                ),
                color: CustomColors.light_gray,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(item['title']),
            subtitle: Text(
              item['desc'],
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardListView(_cards) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _cards.length,
        itemExtent: 200.0,
        itemBuilder: (context, index) {
          var item = _cards[index];
          return _buildCard(item);
        },
      ),
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    //print(data);
    final List<Widget> options = [];
    data.forEach((item) {
      final tempWidget = Container(
          color: CustomColors.secondary,
          child: ListTile(
            title: Text(
              item['subject'],
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/interview/detail',
                arguments: InterviewData(
                    subject: item['subject'], options: item['topics']),
              );
              // final route = MaterialPageRoute(builder: (context) => AlertPage());
              // Navigator.push(context, route);
            },
          ));
      options..add(tempWidget)..add(_buildCardListView(item['topics']));
    });
    return options;
  }

  Widget _buildListView() {
    /*testProvider.loadData().then((options) {
        for (var cards in options) {
          print(cards);
        }
        }
    );*/
    return FutureBuilder(
      future: interviewProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildListView(),
        ),
      ],
    );
  }
}
