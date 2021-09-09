import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/image_and_icons.dart';
import 'package:plant_app/screens/details/components/title_and_price.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(title: 'Angelica', country: 'korea', price: 300),
          SizedBox(height: kDefaultPadding,),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width/2,
                height: 84,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
                  onPressed: (){},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  color: kPrimaryColor,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
                  onPressed: (){} ,
                  color: Colors.amber,
                  height: 84,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )
                  )
                ),
              ),
            ],
          ),
         ],
      ),
    );
  }
}

