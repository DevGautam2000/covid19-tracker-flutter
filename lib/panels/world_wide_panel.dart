import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  const WorldWidePanel({Key? key, required this.worldData}) : super(key: key);
  final Map worldData;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2),
      children: [
        StatusPanel(
          title: "CONFIRMED",
          panelColor: Colors.red.shade100,
          textColor: Colors.red,
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: "ACTIVE",
          panelColor: Colors.blue.shade100,
          textColor: Colors.blue.shade900,
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: "RECOVERED",
          panelColor: Colors.green.shade100,
          textColor: Colors.green,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: "DEATHS",
          panelColor: Colors.grey.shade400,
          textColor: Colors.grey.shade900,
          count: worldData['deaths'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key? key,
      required this.panelColor,
      required this.textColor,
      required this.title,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80.0,
      width: width / 2.0,
      decoration: BoxDecoration(
          color: panelColor, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          )
        ],
      ),
    );
  }
}
