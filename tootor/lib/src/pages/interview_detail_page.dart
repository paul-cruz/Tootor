import 'package:flutter/material.dart';
import 'package:tootor/src/pages/interview_page.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class InterviewDetailPage extends StatefulWidget {
  InterviewDetailPage({Key key}) : super(key: key);

  @override
  _InterviewDetailPageState createState() => _InterviewDetailPageState();
}

class _InterviewDetailPageState extends State<InterviewDetailPage> {
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

  List<Widget> _buildList(List data) {
    List<Widget> optionsList = [];
    data.forEach((element) {
      optionsList..add(_buildCard(element));
    });
    return optionsList;
  }

  @override
  Widget build(BuildContext context) {
    final InterviewData data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.subject),
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: _buildList(data.options),
        ),
      ),
    );
  }
}
