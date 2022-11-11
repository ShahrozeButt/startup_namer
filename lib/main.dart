//SHAHROZE BUTT
//100701891
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Flutter Layout Demo", home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  showConfirmationDialog(BuildContext context, String text) {
    Widget okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Ok"));

    AlertDialog alertDialog = AlertDialog(
      title: const Text("ALERT"),
      content: Text("$text button pressed"),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL', () {
          showConfirmationDialog(context, "Call");
        }),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE', () {
          showConfirmationDialog(context, "Route");
        }),
        _buildButtonColumn(color, Icons.share, 'SHARE', () {
          showConfirmationDialog(context, "Share");
        }),
      ],
    );

    Widget textSection = const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true));

    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text("Kandersteg, Switzerland")
                ],
              )),
          Icon(Icons.star, color: Colors.red[500]),
          const Text("41")
        ]));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Layout Demo'),
      ),
      body: ListView(
        children: [
          Image.asset("images/lake.jpg",
              width: 600, height: 240, fit: BoxFit.cover),
          titleSection,
          buttonSection,
          textSection
        ],
      ),
    );
  }

  TextButton _buildButtonColumn(
      Color color, IconData icon, String label, Function() action) {
    return TextButton(
        onPressed: action,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ));
  }
}