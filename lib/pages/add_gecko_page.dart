import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/database/MySqlHelper.dart';

class AddGeckoPage extends StatefulWidget {
  AddGeckoPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  AddGeckoState createState() => AddGeckoState();
}

class AddGeckoState extends State<AddGeckoPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? geckoName = "agecko";
    int? geckoAge = 2;
    String? geckoOrigin = "korea";
    String? geckoColor = "red";
    String? geckoFather = "1";
    String? geckoMother = "2";
    String? geckoThumbnail = "assets/images/orange.jpeg";
    return Scaffold(
      appBar: AppBar(title: Text(widget.title!)),
      body: GestureDetector(
        onVerticalDragEnd: ((details) {
          if (details.primaryVelocity! > 10) {
            Navigator.of(context).pop();
          }
        }),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${widget.title} page",
                    style: TextStyle(color: kPrimaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoName = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoAge = int.parse(value!);
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoOrigin = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko origin'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoColor = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko color'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoFather = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko father'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoMother = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko mother'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onSaved: (value) {
                    geckoThumbnail = value!;
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Gecko Image'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')));
                      MySqlHelper().addGecko(
                          geckoName!,
                          geckoAge!,
                          geckoOrigin!,
                          geckoColor!,
                          "default desc",
                          geckoFather!,
                          geckoMother!,
                          geckoThumbnail!,
                          "img1, img2",
                          "1/2/");
                    }
                  },
                  child: const Text('Submit'))
            ]),
          ),
        ),
      ),
    );
  }
}
