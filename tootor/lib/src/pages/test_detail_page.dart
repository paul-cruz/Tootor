import 'package:flutter/material.dart';
import 'package:tootor/src/pages/test_page.dart';
import 'package:tootor/src/utils/customized_colors.dart';

class TestDetailPage extends StatefulWidget {
  TestDetailPage({Key key}) : super(key: key);

  @override
  _TestDetailPageState createState() => _TestDetailPageState();
}

class _TestDetailPageState extends State<TestDetailPage> {

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
    List<Widget> options_list = [];
    data.forEach((element) {
      options_list..add(_buildCard(element));
    });
    return options_list;
  }

  @override
  Widget build(BuildContext context) {
    final TestData data = ModalRoute.of(context).settings.arguments;
    print(data.options);
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
