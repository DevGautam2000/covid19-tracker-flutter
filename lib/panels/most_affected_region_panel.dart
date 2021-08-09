import 'package:flutter/material.dart';

class MostAffectedRegionPanel extends StatelessWidget {
  const MostAffectedRegionPanel({Key? key, required this.countryData})
      : super(key: key);

  final List countryData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var country = countryData[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                    image: NetworkImage(country['countryInfo']['flag'],
                        scale: 3.0)),
                Text(
                  country['country'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Deaths: ${country['deaths'].toString()}",
                  style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
