import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zeitplan/domain/entity/entity.dart';
import 'package:zeitplan/ui/page/contacts/contacts.dart';

class ContactItem extends StatelessWidget {
  final ContactEntity contact;

  String get formatedCPF {
    final String _cpf = contact.cpf!;
    return "${_cpf.substring(0, 3)}.${_cpf.substring(3, 6)}.${_cpf.substring(6, 9)}-${_cpf.substring(9)}";
  }

  const ContactItem({required this.contact, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactsPresenter presenter = Provider.of<ContactsPresenter>(context);
    return GestureDetector(
      onLongPress: () {
        //presenter edit contact
      },
      onTap: () {
        presenter.call(contact.phones!.first.number!);
      },
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(contact.picture!),
                  maxRadius: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${contact.firstName} ${contact.lastName}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Text(
              "${contact.email}\n$formatedCPF",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            //PhoneList(phones: contact.phones!),
            Text(
              "Clique no card para ligar..\nClique e segure para editar..",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneList extends StatelessWidget {
  final List<PhoneEntity> phones;

  const PhoneList({required this.phones, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: phones.length,
      itemBuilder: (BuildContext context, int index) {
        PhoneEntity phone = phones[index];
        return Text(phone.number!);
      },
    );
  }
}
