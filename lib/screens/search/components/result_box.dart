import 'package:flutter/material.dart';
import 'package:weather/screens/search/components/result_text.dart';
class Results extends StatelessWidget {

final name;
final temp;
final hum;
final country;

  const Results({Key key, this.name, this.temp, this.hum, this.country}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return                            Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: MediaQuery.of(context).size.width/1.5,
        height: MediaQuery.of(context).size.height/3.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(.2)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultText(data:  name,),
            ResultText(data:temp,),
            ResultText(data:   hum),
            ResultText(data: country),

          ],
        ),
      ),
    )
    ;
  }
}
