import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/home/components/photo_hero.dart';
import 'package:graphview/GraphView.dart';

class HeroDetailView extends StatefulWidget {
  final String? img;
  final Gecko gecko;
  HeroDetailView({
    Key? key,
    this.img,
    required this.gecko,
  }) : super(key: key);

  @override
  State<HeroDetailView> createState() => _HeroDetailViewState();
}

class _HeroDetailViewState extends State<HeroDetailView> {
  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        GestureDetector(
          child: Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/yellow.jpeg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(63),
                bottomLeft: Radius.circular(63),
                topRight: Radius.circular(63),
                bottomRight: Radius.circular(63),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.3),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Icon(Icons.male, color: Colors.black, size: 15,),
            Text(' Gecko ${a}', style: TextStyle(color: Colors.black),),
          ],
        ),
      ]),
    );
  }

  final Graph graph = Graph()..isTree = true;

  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    final node9 = Node.Id(9);
    final node10 = Node(rectangleWidget(10)); //using deprecated mechanism of directly placing the widget here
    final node11 = Node(rectangleWidget(11));
    final node12 = Node(rectangleWidget(12));

    graph.addEdge(node1, node2);
    graph.addEdge(node2, node12);
    // graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node3);
    // graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node2, node5);
    graph.addEdge(node2, node6);
    // graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node7);
    // graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    graph.addEdge(node6, node8);
    graph.addEdge(node3, node4);
    graph.addEdge(node3, node5);
    // graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    // graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    // graph.addEdge(node11, node12);

    builder
      ..siblingSeparation = (10)
      ..levelSeparation = (20)
      ..subtreeSeparation = (10)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_BOTTOM_TOP);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gecko.name != null ? widget.gecko.name! : 'Gecko'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(10),
              minScale: 1.0,
              maxScale: 3.6,
              child: GraphView(
                graph: graph,
                algorithm:
                BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                ..color = Colors.green
                ..strokeWidth = 1
                ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  // I can decide what widget should be shown here based on the id
                  var a = node.key?.value as int;
                  return rectangleWidget(a);
                },
            )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // color: Colors.lightBlueAccent,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: PhotoHero(
              img: widget.gecko.thumbnail,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23))
                ]),
                child: Row(children: [
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "${widget.gecko.name}\n".toUpperCase(), style: Theme.of(context).textTheme.button),
                          TextSpan(text: "${widget.gecko.origin}".toUpperCase(), style: TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                        ]
                    ),),
                    Spacer(),
                    Text('${widget.gecko.age} years old', style: Theme.of(context).textTheme.button!.copyWith(color: kPrimaryColor))
                ],)
          ), SizedBox(height: 50,)
        ],
      ),
    );
  }
}
