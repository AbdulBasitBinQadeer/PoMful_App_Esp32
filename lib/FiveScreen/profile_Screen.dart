import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warda/Auth/Sign%20In/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        centerTitle: true, // Center the AppBar title
        elevation: 0, // Remove shadow for cleaner look
      ),
      body: ListView(
        children:[
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Create an account.",
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
                  const SizedBox(height: 20), // Space between title and form fields
                  const ReusableText(headingText: 'Name'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: ''),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Last Name'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: ''),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'E-mail'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: '', isEmail: true),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Occupant Phone'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: '', isEmail: true),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Wait Time'),
                  const SmallTextField(labelText: ''),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Notification Time'),
                  const SmallTextField(labelText: ''),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Number of Notification'),
                  const SmallTextField(labelText: ''),

                  const SizedBox(height: 32), // Space before button
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Make button full width
                      child:ElevatedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF90c43c),
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        label: Text(
                          'Continue',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 80,)
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

class SmallTextField extends StatelessWidget {
  final String labelText;
  final bool isEmail;

  const SmallTextField({
    super.key,
    required this.labelText,
    this.isEmail = false, // default is false, set to true for email fields
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 180),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
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
