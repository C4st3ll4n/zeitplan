import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeitplan/domain/entity/entity.dart';
import 'package:zeitplan/ui/page/contacts/contacts.dart';

class ContactItem extends StatelessWidget {
  final ContactEntity contact;

  const ContactItem({required this.contact, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactsPresenter presenter = Provider.of<ContactsPresenter>(context);
    return GestureDetector(
      onTap: () {
        presenter.call(contact.phones!.first.number!);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    color: Colors.black)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${contact.firstName}"),
              SizedBox(),
              Text("${contact.lastName}"),
              SizedBox(),
              Text(
                "Clique no card para ligar..",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
