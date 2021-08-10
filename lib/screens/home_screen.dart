import 'dart:convert';

import 'package:covid_app/data/data_source.dart';
import 'package:covid_app/pages/country.dart';
import 'package:covid_app/panels/info_panel.dart';
import 'package:covid_app/panels/most_affected_region_panel.dart';
import 'package:covid_app/panels/world_wide_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map? worldData;
  List? countryData;
  List? countryDataCopy;

  fetchWorldData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/all'));
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  fetchCountryData() async {
    http.Response response = await http
        .get(Uri.parse('https://corona.lmao.ninja/v3/covid-19/countries'));
    setState(() {
      countryData = jsonDecode(response.body);
      countryDataCopy = jsonDecode(response.body);
      countryData!.sort((a, b) => b['deaths'].compareTo(a['deaths']));
    });
  }

  @override
  void initState() {
    fetchWorldData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Covid-19 Tracker".toUpperCase()),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              color: Colors.orange.shade100,
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Worldwide",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryBlack),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  CountryPage(countryData: countryDataCopy!))),
                      child: Text("Regional"))
                ],
              ),
            ),
            worldData == null
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10.0),
                    height: 80.0,
                    child: CircularProgressIndicator(),
                  )
                : WorldWidePanel(
                    worldData: worldData!,
                  ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Affected Countries",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ],
              ),
            ),
            countryData == null
                ? Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10.0),
                    height: 80.0,
                    child: CircularProgressIndicator(),
                  )
                : MostAffectedRegionPanel(countryData: countryData!),
            InfoPanel(),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text(
                "We Are Together In The Fight!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
