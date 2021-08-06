import 'package:flutter/cupertino.dart';
import 'package:zeitplan/main/factory/page/contacts/contacts_presenter_factory.dart';
import 'package:zeitplan/ui/page/contacts/contacts_page.dart';

Widget makeContactPage() => ContactsPage(presenter: makeGetXContactsPresenter());