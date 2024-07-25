import 'package:appointment/components/customercard_stream.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments', style: TextStyle(
            fontSize: 24
        ),),
        backgroundColor: Colors.orange,
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomerCardStream()
            ],
          ),
        ),
      ),
    );
  }
}
