import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class CustomDraw extends StatelessWidget {
  const CustomDraw({Key? key, this.items}) : super(key: key);
  final List<String>? items;
  @override
  Widget build(BuildContext context) {
    List<String> menuItems = List.from(items!);
    menuItems.insert(0, 'drawer');
    return Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: kPrimaryColor,
        child: ListView(
          children: menuItems.asMap().entries.map((element) {
            if (element.key == 0) {
              return (DrawerHeader(
                  child: Text(
                'Menu',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )));
            }
            return ListTile(
              title: Text(element.value,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onTap: () {},
            );
          }).toList(),
          //children: [
          //const DrawerHeader(
          //child: Text('menu'),
          //),
          //ListTile(
          //title: const Text('Item 1'),
          //onTap: () {},
          //),
          //ListTile(
          //title: const Text('Item 2'),
          //onTap: () {},
          //),
          //ListTile(
          //title: const Text('Item 3'),
          //onTap: () {},
          //),
          //ListTile(
          //title: const Text('Item 4'),
          //onTap: () {},
          //),
          //],
        ));
  }
}
