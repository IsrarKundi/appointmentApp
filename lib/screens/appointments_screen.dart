import 'package:appointment/components/customercard_stream.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'book_appointment');
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 36, left: 24, right: 24),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            ),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search here...',
                              // Ensure no conflicting styles
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {

                              }),
                        ),

                        ),
                      ),

                    SizedBox(width: 8,),
                    Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.black26,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Search', style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),)
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              CustomerCardStream(displayMode: 3),
            ],
          ),
        ),
      ),
    );
  }
}
