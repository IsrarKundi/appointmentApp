import 'package:appointment/screens/appointments_screen.dart';
import 'package:appointment/screens/book_appointment.dart';
import 'package:appointment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAlSEYcGyhGUFtz8iaSCnAiwCCxc_VrI_Q',
      appId: '1:114539683397:android:14704311c3a53c0c0dcd2c',
      messagingSenderId: '114539683397',
      projectId: 'salon-appointment-b7091',
      storageBucket: 'salon-appointment-b7091.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: HomeScreen(),
        initialRoute: 'home_screen',
        routes: {
          'book_appointment': (context) => BookAppointment(),
          'appointments_screen': (context) => AppointmentsScreen(),
          'home_screen': (context) => HomeScreen(),
        }
    );
  }
}
