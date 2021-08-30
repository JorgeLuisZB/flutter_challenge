import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/model/section_model.dart';

/// Add elevation effect to Container
const card_shadow = [
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.13),
    spreadRadius: 1,
    blurRadius: 2,
    offset: Offset(0, 3), // changes position of shadow
  )
];
const double pading16 = 16;

double getScreenHeight(context) => MediaQuery.of(context).size.height;
double getScreenWidth(context) => MediaQuery.of(context).size.width;

// Curve path for Appbar
Path curvePath(Size size, double firstMinusHeight, double secondMinusHeight) {
  Path path = new Path();

  path.lineTo(0, size.height - 15);
  var firstStart = Offset(size.width / 5, size.height);
  var firstEnd = Offset(size.width / 2.25, size.height - 20.0);
  path.quadraticBezierTo(
      firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
  var secondStart =
      Offset(size.width - (size.width / 3.24), size.height - 45.25);
  var secondEnd = Offset(size.width, size.height - 5);
  path.quadraticBezierTo(
      secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
  path.lineTo(size.width, 0);
  path.close();

  return path;
}

/// Group items by the first letter of the data
List<SectionModel> groupByCharacter(List<String> data) {
  data.sort();

  List result = data
      .fold({}, (previousValue, element) {
        Map val = previousValue as Map;
        String char = element.substring(0, 1);
        if (!val.containsKey(char)) {
          val[char] = [];
        }
        val[char]?.add(element);
        return val;
      })
      .entries
      .map((e) => {e.key: e.value})
      .toList();

  List<Map> toMap = [];
  List<SectionModel> sections = [];
  toMap.addAll(result as List<Map>);

  for (int i = 0; i < toMap.length; i++) {
    String sectionKey = '';
    List<dynamic> sectionValue = [];

    for (String key in toMap[i].keys) {
      sectionKey = key;
    }

    for (List<dynamic> value in toMap[i].values) {
      sectionValue = value;
    }

    SectionModel newSection =
        SectionModel(title: sectionKey, data: sectionValue);
    sections.add(newSection);
  }

  return sections;
}
