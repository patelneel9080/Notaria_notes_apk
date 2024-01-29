import 'package:flutter/material.dart';

class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Birth Year Counter',style: TextStyle(color: Colors.white),),
      ),
      body: BirthYearCounter(),
    );
  }
}

class BirthYearCounter extends StatefulWidget {
  @override
  _BirthYearCounterState createState() => _BirthYearCounterState();
}

class _BirthYearCounterState extends State<BirthYearCounter> {
  int birthYear = 2000;
  int currentYear = DateTime.now().year;


  @override
  Widget build(BuildContext context) {
    int age = currentYear - birthYear;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Birth Year: $birthYear',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Your Age: $age years old',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime(birthYear),
                firstDate: DateTime(1900),
                lastDate: DateTime(currentYear),
              ).then((selectedDate) {
                if (selectedDate != null && selectedDate.year != birthYear) {
                  setState(() {
                    birthYear = selectedDate.year;
                  });
                }
              });
            },
            child: Text('Select Birth Year'),
          ),
        ],
      ),
    );
  }
}