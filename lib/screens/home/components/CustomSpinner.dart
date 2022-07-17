import 'package:flutter/material.dart';

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    Key? key,
    required this.spinnerVisible,
  }) : super(key: key);

  final bool spinnerVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: spinnerVisible,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
