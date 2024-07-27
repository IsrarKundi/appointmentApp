import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;

class EditAppointmentScreen extends StatefulWidget {
  final String id;
  final String name;
  final String service;
  final DateTime time;

  EditAppointmentScreen({required this.id, required this.name, required this.service, required this.time});

  @override
  _EditAppointmentScreenState createState() => _EditAppointmentScreenState();
}

class _EditAppointmentScreenState extends State<EditAppointmentScreen> {
  late TextEditingController _nameController;
  late String _selectedService;
  late DateTime _selectedDateTime;

  final List<String> _services = ['Haircut', 'Manicure', 'Massage', 'Pedicure'];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _selectedService = widget.service;
    _selectedDateTime = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Appointment'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              SizedBox(height: 20),
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
                    _selectedService = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Date: ${DateFormat('dd/MM/yyyy').format(_selectedDateTime)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDateTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedDateTime = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        _selectedDateTime.hour,
                        _selectedDateTime.minute,
                      );
                    });
                  }
                },
              ),
              ListTile(
                title: Text('Time: ${DateFormat('HH:mm').format(_selectedDateTime)}'),
                trailing: Icon(Icons.access_time),
                onTap: () async {
                  final TimeOfDay? time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
                  );
                  if (time != null) {
                    setState(() {
                      _selectedDateTime = DateTime(
                        _selectedDateTime.year,
                        _selectedDateTime.month,
                        _selectedDateTime.day,
                        time.hour,
                        time.minute,
                      );
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              new Container(
                width: 300.0,
                height: 67,
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    _fireStore.collection('appointments').doc(widget.id).update({
                      'name': _nameController.text,
                      'service': _selectedService,
                      'time': _selectedDateTime,
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Save Changes', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
