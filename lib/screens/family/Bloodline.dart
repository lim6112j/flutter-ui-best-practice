import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../../constants.dart';

class Bloodline extends StatefulWidget {
  Bloodline({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BloodlineState createState() => _BloodlineState();
}

class _BloodlineState extends State<Bloodline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
            ),
            Wrap(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.siblingSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: "Sibling Separation"),
                    onChanged: (text) {
                      builder.siblingSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.levelSeparation.toString(),
                    decoration: InputDecoration(labelText: "Level Separation"),
                    onChanged: (text) {
                      builder.levelSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.subtreeSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: "Subtree separation"),
                    onChanged: (text) {
                      builder.subtreeSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.orientation.toString(),
                    decoration: InputDecoration(labelText: "Orientation"),
                    onChanged: (text) {
                      builder.orientation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_box_outlined),
                  onPressed: () {
                    //final node12 = Node(rectangleWidget(r.nextInt(100)));
                    final node12 = Node.Id(r.nextInt(100));
                    var edge =
                        graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                    print(edge);
                    graph.addEdge(edge, node12);
                    setState(() {});
                  },
                )
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 1.0,
                  maxScale: 3.6,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
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
          ],
        ));
  }

  Random r = Random();

  Widget rectangleWidget(int a) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.male,
              color: Colors.white,
              size: 15,
            ),
            Text(
              ' Gecko $a',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ]),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id(1);
    final node2 = Node.Id(2);
    final node3 = Node.Id(3);
    final node4 = Node.Id(4);
    final node5 = Node.Id(5);
    final node6 = Node.Id(6);
    final node8 = Node.Id(7);
    final node7 = Node.Id(8);
    //final node9 = Node.Id(9);
    //final node10 = Node(rectangleWidget(
    //10)); //using deprecated mechanism of directly placing the widget here
    //final node11 = Node(rectangleWidget(11));
    //final node12 = Node(rectangleWidget(12));

    //final node10 = Node.Id(10); //using deprecated mechanism of directly placing the widget here
    //final node11 = Node.Id(rectangleWidget(11));
    //final node12 = Node.Id(rectangleWidget(12));
    graph.addEdge(node1, node2);
    //graph.addEdge(node2, node12);
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
}
