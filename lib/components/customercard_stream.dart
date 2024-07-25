import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customer_card.dart';

final _fireStore = FirebaseFirestore.instance;
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
        return Container(
          height: 500,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: customerCards,
          ),
        );
      },
    );
  }
}
