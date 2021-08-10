import 'package:covid_app/data/data_source.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("FAQs"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              DataSource.questionAnswers[index]['question'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(DataSource.questionAnswers[index]['answer']),
              )
            ],
          );
        },
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
