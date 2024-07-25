import 'package:flutter/material.dart';
import 'package:appointment/components/widgets.dart';
import 'package:appointment/components/customercard_stream.dart';


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



// commit

