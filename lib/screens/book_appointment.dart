import 'dart:ui';
import 'package:appointment/components/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime? _selectedDateTime;
  String? _selectedService;


  final List<String> _services = ['Haircut', 'Manicure', 'Massage', 'Pedicure'];

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
                child: const TextField(
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            fontSize: 16
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.orange
                            )
                        ),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.black54))
                    )
                ),
              ),
              SizedBox(height: 25,),
              // FormFields('Select Service',Icons.arrow_drop_down),
              SizedBox(
                height: 62,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black.withOpacity(1), width: 0.6),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Select Service', style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87
                        ),),
                        DropdownButton<String>(
                          value: _selectedService,
                          items: _services.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(
                                color: Colors.orange
                              ),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedService = newValue;
                            });
                          },
                          underline: Container(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text('Date:  ', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                  Text(
                    _selectedDateTime != null
                        ? DateFormat('dd/MM/yyyy').format(_selectedDateTime!)
                        : 'Not selected',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text('Time:  ', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                  Text(
                    _selectedDateTime != null
                        ? DateFormat('HH:mm').format(_selectedDateTime!)
                        : 'Not selected',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              Align(
                alignment: Alignment.centerLeft,
                child: UnderlinedTextButton(
                  text: 'Say When',
                  onTap: () async {
                    final DateTime? dateTime = await showOmniDateTimePicker(
                      context: context,
                    );
                    if (dateTime != null) {
                      setState(() {
                        _selectedDateTime = dateTime;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 50,),
              Container(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                      ),
                      onPressed: () {
                        // Add booking logic here
                      },
                      child: const Text(
                        'Book',
                        style: TextStyle(
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
