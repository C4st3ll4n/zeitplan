import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zeitplan/domain/entity/entity.dart';

import 'contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    required this.data,
    Key? key,
  }) : super(key: key);
  final List<ContactEntity> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CarouselSlider(
        items: data.map((e) => ContactItem(contact: e)).toList(),
        options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 1,
            enableInfiniteScroll: true),
      ),
    );
  }
}
