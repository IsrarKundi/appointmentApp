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
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: getStatusColor(service),
              width: 5.0,
            ),
          ),
        ),
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
      ),
    );
  }

  Color getStatusColor(String serviceType) {
    switch (serviceType) {
      case 'Haircut':
        return Color(0xff3B82F6);
      case 'Manicure':
        return Color(0xFFFB7185);
      case 'Massage':
        return Color(0xFF84CC16);
      case 'Pedicure':
        return Color(0xFFD13FED);
      default:
        return Colors.grey; // Default color if status does not match any case
    }
  }
}