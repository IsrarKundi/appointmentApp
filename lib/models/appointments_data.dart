import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appointments.dart';

class AppointmentData extends ChangeNotifier {
  List<Appointment> appointments = [];

  AppointmentData() {
    // loadAppointments();
  }

  int getCount() {
    return appointments.length;
  }

  void addAppointment(Appointment newAppointment) async {
    appointments.add(newAppointment);
    await FirebaseFirestore.instance.collection('appointments').add({
      'name': newAppointment.name,
      'service': newAppointment.service,
      'time': newAppointment.time,
      'id': newAppointment.id,
    });
    // saveAppointments();
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
