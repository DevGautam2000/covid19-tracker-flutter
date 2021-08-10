import 'package:covid_app/data/data_source.dart';
import 'package:covid_app/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (_) => FAQ())),
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: primaryBlack, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FAQs",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => launch(
              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate"),
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: primaryBlack, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DONATE",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => launch(
              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters"),
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: primaryBlack, borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MYTH BUSTERS",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
