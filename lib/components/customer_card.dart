import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomerCard extends StatelessWidget {
  final String name;
  final String service;
  final DateTime time;

  CustomerCard({required this.name, required this.service, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              flex: 2,
              child: Text(
                DateFormat('dd/MM/yyyy').format(time),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Text(
                DateFormat('HH:mm').format(time),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}