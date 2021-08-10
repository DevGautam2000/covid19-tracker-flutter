import 'package:covid_app/data/data_source.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key, required this.countryData}) : super(key: key);
  final List countryData;

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    var data = widget.countryData;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Country Stats"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20.0,
                    color: Colors.grey,
                    offset: Offset(2.0, 10.0))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[index]['country'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: primaryBlack),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                      image: NetworkImage(data[index]['countryInfo']['flag'],
                          scale: 1.8)),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirmed: ${data[index]['cases']}",
                        style: _textStyle(Colors.red),
                      ),
                      Text(
                        "Active: ${data[index]['active']}",
                        style: _textStyle(Colors.blue),
                      ),
                      Text(
                        "Recovered: ${data[index]['recovered']}",
                        style: _textStyle(Colors.green),
                      ),
                      Text(
                        "Deaths: ${data[index]['deaths']}",
                        style: _textStyle(Colors.grey.shade900),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        itemCount: data.length,
      ),
    );
  }

  _textStyle(Color color) => TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      );
}
