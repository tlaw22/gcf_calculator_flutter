// Import the flutter and material libraries
import 'package:flutter/material.dart';

// A function to find the greatest common factor of two numbers
int gcf(int a, int b) {
  // If one of the numbers is zero, the other is the gcf
  if (a == 0) return b;
  if (b == 0) return a;
  // If both numbers are equal, either one is the gcf
  if (a == b) return a;
  // If one of the numbers is divisible by the other, the smaller one is the gcf
  if (a % b == 0) return b;
  if (b % a == 0) return a;
  // Otherwise, use Euclid's algorithm to find the gcf
  // The gcf of two numbers is the same as the gcf of their difference and the smaller number
  if (a > b) return gcf(a - b, b);
  else return gcf(b - a, a);
}

// A widget to display a text field with a label
class InputField extends StatelessWidget {
  // A constructor to initialize the label and controller properties
  const InputField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  // A final string to store the label text
  final String label;
  // A final text editing controller to control the text field
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // Return a column widget with the label and text field
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // A text widget to display the label
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        // A sized box widget to add some vertical space
        SizedBox(height: 8),
        // A text field widget to accept user input
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a number',
          ),
        ),
      ],
    );
  }
}

// A widget to display the app UI
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// A state class to manage the app state
class _MyAppState extends State<MyApp> {
  // Declare two text editing controllers to control the input fields
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  // Declare a string variable to store the result text
  String result = '';

  @override
  Widget build(BuildContext context) {
    // Return a material app widget with a scaffold widget as its home
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GCF Calculator'),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.blue[900],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // A input field widget for the first number
              InputField(
                label: 'First number',
                controller: num1Controller,
              ),
              // A sized box widget to add some vertical space
              SizedBox(height: 16),
              // A input field widget for the second number
              InputField(
                label: 'Second number',
                controller: num2Controller,
              ),
              // A sized box widget to add some vertical space
              SizedBox(height: 16),
              // A elevated button widget to calculate the gcf
              ElevatedButton(
                onPressed: () {
                  AlertDialog(backgroundColor: Colors.deepPurple, title: Text('Greatest Common Factor'),
                    content: Container(color: Colors.deepPurple),
                    titlePadding: EdgeInsets.all(15.0),
                    alignment: Alignment.center,
                  );

                  // Get the input values from the controllers and convert them to integers
                  int num1 = int.parse(num1Controller.text);
                  int num2 = int.parse(num2Controller.text);
                  // Call the gcf function and store the result in a string variable
                  result = 'The greatest common factor of $num1 and $num2 is ${gcf(num1, num2)}';
                  // Update the app state by calling setState method
                  setState(() {});
                },
                child: Text('Calculate'),
              ),
              // A sized box widget to add some vertical space
              SizedBox(height: 16),
              // A text widget to display the result
              Text(
                result,
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A main function to run the app
void main() {
  runApp(MyApp());
}