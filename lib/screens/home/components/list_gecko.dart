
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gecko_app/state/GeckoModel.dart';

class ListGecko extends StatelessWidget {
  const ListGecko({
    Key? key,
    required this.gecko,
  }) : super(key: key);

  final GeckoModel gecko;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 80 * (gecko.geckos.length.toDouble()),
        child: ListView.builder(
          itemCount: gecko.geckos.length,
          itemBuilder: (context, index) => Card(
              child: ListTile(
                  title: Text(gecko.geckos[index].name!),
                  subtitle: Text(gecko.geckos[index].color!),
                  trailing: Image.asset(gecko.geckos[index].thumbnail!),
                ),
              ),
        ),
      ),
    );
  }
}
