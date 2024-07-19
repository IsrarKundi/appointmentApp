import 'package:flutter/material.dart';

import '../models/appointments.dart';
import 'package:appointment/components/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(0),
                    bottomRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                color: Colors.orange,
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(height: 40,),
                    Text(
                      'Welcome Admin',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Here are your upcoming appointmnets',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(
                              color: Colors.orange
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
            ),
          ),
          Positioned.fill(
            top: screenHeight * 0.3,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
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
                                  appointments[index].name,
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
                                  appointments[index].date,
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
                                  appointments[index].time,
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
                    },
                  ),
                ),
                lowerSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Appointment> appointments = [
  Appointment(name: 'Israr', date: 'Today', time: '11:00'),
  Appointment(name: 'Ali', date: 'Tomorrow', time: '9:00'),
  Appointment(name: 'Ahmad', date: '25/7/24', time: '11:30'),
  Appointment(name: 'Eesa', date: '25/7/24', time: '3:00'),
  Appointment(name: 'Umer', date: '26/7/24', time: '9:00'),
];