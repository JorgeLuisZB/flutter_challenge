import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/pages/contacts/contacts_page.dart';
import 'package:jorge_zaragoza_challenge/pages/contacts/contact_detail_page.dart';

/// All routes in the app
var appRoutes = <String, WidgetBuilder>{
  '/': (context) => ContactsPage(),
  'contacts/detail': (context) => ContactDetailPage(),
};
