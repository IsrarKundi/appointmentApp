import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/editapoointment_screen.dart';

class CustomerCard extends StatelessWidget {
  final String name;
  final String service;
  final DateTime time;
  final String id;

  CustomerCard({required this.name, required this.service, required this.time, required this.id}); // Include id in the constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: GestureDetector(
        onLongPress: (){
          _deleteAppointment(context, id);
        },
        onDoubleTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditAppointmentScreen(
                id: id,
                name: name,
                service: service,
                time: time,
              ),
            ),
          );
        },
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
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }

  void _deleteAppointment(BuildContext context, String id) {
    final _fireStore = FirebaseFirestore.instance;

    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Appointment'),
          content: Text('Are you sure you want to delete this appointment?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(
                color: Colors.blueAccent
              ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(
                  color: Colors.blueAccent
              )),
              onPressed: () {
                _fireStore.collection('appointments').doc(id).delete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
