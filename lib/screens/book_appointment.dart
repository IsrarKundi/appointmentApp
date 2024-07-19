import 'dart:ui';
import 'package:appointment/components/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back)
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Text(
                'Book Appointment',
                style: TextStyle(
                fontSize: 24
              ),
              ),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                height: 55,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                      fontSize: 16
                    ),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.black54))
                  )
                ),
              ),
              SizedBox(height: 25,),
              FormFields('Select Service',Icons.arrow_drop_down),
              SizedBox(height: 25,),
              FormFields('Select Date',Icons.date_range),
              SizedBox(height: 25,),
              FormFields('Select Time',Icons.watch_later_outlined),
              SizedBox(height: 155,),
              Container(
                width: 400,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                      onPressed: (){},
                      child: Text('Book', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}


