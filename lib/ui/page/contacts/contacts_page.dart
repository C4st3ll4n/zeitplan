import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entity/entity.dart';
import 'components/components.dart';
import 'contacts_presenter.dart';

class ContactsPage extends StatefulWidget {
  final ContactsPresenter presenter;

  const ContactsPage({Key? key, required this.presenter}) : super(key: key);

  @override
  _ContactsPageState createState() {
    presenter.loadData();
    return _ContactsPageState(presenter);
  }
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsPresenter presenter;

  _ContactsPageState(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zeitplan"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //presenter go to add contact
              },
              icon: Icon(Icons.person_add)),
        ],
      ),
      body: Builder(
        builder: (_) {
          StreamBuilder<bool>(
            stream: presenter.isLoadingStream,
            builder: (_, snap) {
              if (snap.data == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  width: 0,
                  height: 0,
                );
              }
            },
          );

          return StreamBuilder<List<ContactEntity>>(
              stream: presenter.contactsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Deu ruim.");
                }

                if (snapshot.hasData) {
                  return Provider(
                      create: (BuildContext context) => presenter,
                      child: ContactList(data: snapshot.data!));
                } else {
                  return Container(
                    width: 0,
                    height: 0,
                  );
                }
              });
        },
      ),
    );
  }
}
