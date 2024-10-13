import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "PoM",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "ful",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF90c43c), // Updated color
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15,top: 10),
              child: Text(
                "Reset your password.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                children: [
                  const SizedBox(height: 80), // Space between title and form fields
                  const ReusableText(headingText: 'Email'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: ''),
                  const SizedBox(height: 120), // Space before button
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Make button full width
                      child:ElevatedButton.icon(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF90c43c),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        label: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  final String labelText;
  final bool isEmail;

  const ReusableTextField({
    super.key,
    required this.labelText,
    this.isEmail = false, // default is false, set to true for email fields
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    );
  }
}


class ReusableText extends StatelessWidget{
  final String headingText;

  const ReusableText({
    super.key,
    required this.headingText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(headingText,style: const TextStyle(color: Colors.black,fontSize: 20),),
      ],
    );
  }


}
