import 'package:flutter/material.dart';

Widget FormFields(String label, IconData icon){
  return SizedBox(
    height: 60,
    child: TextField(
        decoration: InputDecoration(
          hintText: label,
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(),
        )
    ),
  );
}

Widget lowerSection(){
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 40, left: 16, right: 16),
    child: Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 10,),
                Text('Haircut')
              ],
            ),
            SizedBox(width: 140,),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.brown,
                ),
                SizedBox(width: 10,),
                Text('Manicure')
              ],
            )
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.yellow,
                ),
                SizedBox(width: 10,),
                Text('Massage')
              ],
            ),
            SizedBox(width: 128,),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.green,
                ),
                SizedBox(width: 10,),
                Text('Pedicure')
              ],
            )
          ],
        )
      ],
    ),
  );
}