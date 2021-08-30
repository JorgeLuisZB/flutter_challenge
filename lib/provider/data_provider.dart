import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/data/contacts_data.dart' as data;
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as utils;
import 'package:jorge_zaragoza_challenge/model/section_model.dart';

/// DataProvider is used to manage the state of Widgets
class DataProvider extends ChangeNotifier {
  final _initialSections = utils.groupByCharacter(data.contactsData);

  List<SectionModel> get initialSections => _initialSections;

  List<dynamic> _dataSection(SectionModel currentSection) => _initialSections
      .where((section) => section.title == currentSection.title)
      .first
      .data;

  /// Load more sections to the list
  Future fetchMoreSections(SectionModel currentSection) async {
    final newSections = _initialSections
        .where((section) => section.title == currentSection.title)
        .first;
    newSections.isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 600));
    for (int i = 0; i < currentSection.data.length; i++) {
      if (i % 2 == 0) {
        _dataSection(currentSection).add(currentSection.data[i]);
      }
    }
    notifyListeners();

    final finalSections = _initialSections
        .where((section) => section.title == currentSection.title)
        .first;
    finalSections.isComplete = true;
    finalSections.isLoading = false;
    notifyListeners();
  }
}
