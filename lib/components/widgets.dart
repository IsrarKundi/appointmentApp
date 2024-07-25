import 'package:flutter/material.dart';

// file for different custom widgets for reuse

Widget FormFields(String label, IconData icon) {
  return SizedBox(
    height: 62,
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black.withOpacity(1), width: 0.6),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black87
            ),),
            Icon(icon),
          ],
        ),
      ),
      color: Colors.white,
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


class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  UnderlinedTextButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.orange,
          decoration: TextDecoration.underline,
          decorationColor: Colors.orange,
          fontSize: 18,
          decorationThickness: 2,
          fontWeight: FontWeight.bold

        ),
      ),
    );
  }
}

