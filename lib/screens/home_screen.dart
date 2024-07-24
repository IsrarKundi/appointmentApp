import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/appointments.dart';
import 'package:appointment/components/widgets.dart';

final _fireStore = FirebaseFirestore.instance;

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
                  bottomLeft: Radius.circular(35),
                ),
                color: Colors.orange,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    SizedBox(height: 40),
                    Text(
                      'Welcome Admin',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Here are your upcoming appointments',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.orange),
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
            top: screenHeight * 0.32,
            child: Column(
              children: [
                Expanded(
                  child: CustomerCardStream(),
                ),
                lowerSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomerCardStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _fireStore.collection('appointments').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final customers = snapshot.data?.docs;
        List<CustomerCard> customerCards = [];
        int count = 0;
        for (var customer in customers!) {
          if (count >= 5) break;  // Limit to 5 cards
          final customerData = customer.data() as Map<String, dynamic>;
          final customerName = customerData['name'];
          final service = customerData['service'];
          final timestamp = customerData['time'] as Timestamp;
          final dateTime = timestamp.toDate();

          final customerCard = CustomerCard(
            name: customerName,
            service: service,
            time: dateTime,
          );

          customerCards.add(customerCard);
          count++;
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: customerCards,
        );
      },
    );
  }
}

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

