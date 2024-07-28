import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appointments.dart';

class AppointmentData extends ChangeNotifier {
  final _fireStore = FirebaseFirestore.instance;

  List<Appointment> _appointments = [];

  List<Appointment> get appointments => _appointments;
  AppointmentData() {
    loadAppointments();
  }

  // Provider.of<AppointmentData>(context, listen: false).addTask(newTask);

  int getCount() {
    return appointments.length;
  }



  Future<void> loadAppointments() async {
    var snapshot = await _fireStore.collection('appointments').get();
    _appointments = snapshot.docs.map((doc) {
      return Appointment(
        id: doc.id,
        name: doc['name'],
        service: doc['service'],
        time: (doc['time'] as Timestamp).toDate(),
      );
    }).toList();
    notifyListeners();
  }

  Future<void> addAppointment(Appointment appointment) async {
    var docRef = await _fireStore.collection('appointments').add({
      'name': appointment.name,
      'service': appointment.service,
      'time': appointment.time,
    });

    appointment.id = docRef.id;
    _appointments.add(appointment);
    notifyListeners();
  }
  void updateAppointment(String id, Appointment updatedAppointment) async {
    int index = appointments.indexWhere((appointment) => appointment.id == id);
    if (index != -1) {
      appointments[index] = updatedAppointment;
      await FirebaseFirestore.instance.collection('appointments').doc(id).update({
        'name': updatedAppointment.name,
        'service': updatedAppointment.service,
        'time': updatedAppointment.time,
      });
      // saveAppointments();
      notifyListeners();
    }
  }

  void deleteAppointment(String id) async {
    appointments.removeWhere((appointment) => appointment.id == id);
    await FirebaseFirestore.instance.collection('appointments').doc(id).delete();
    // saveAppointments();
    notifyListeners();
  }

  // Future<void> saveAppointments() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String> appointmentList = appointments.map((appointment) => jsonEncode(appointment.toMap())).toList();
  //   prefs.setStringList('appointments', appointmentList);
  // }
  //
  // Future<void> loadAppointments() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? appointmentList = prefs.getStringList('appointments');
  //   if (appointmentList != null) {
  //     appointments = appointmentList.map((appointment) => Appointment.fromMap(jsonDecode(appointment))).toList();
  //   }
  //   notifyListeners();
  // }
}
