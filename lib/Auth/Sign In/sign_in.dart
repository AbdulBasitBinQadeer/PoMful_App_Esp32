import 'package:flutter/material.dart';
import 'package:warda/Main/main_page.dart';

import '../ResetPassword/ResetPasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Sign into your account.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 58),
              child: Column(
                children: [
                  const SizedBox(height: 120), // Space between title and form fields
                  const ReusableText(headingText: 'Email'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: ''),
                  const SizedBox(height: 10),
                  const ReusableText(headingText: 'Password'),
                  const SizedBox(height: 5),
                  const ReusableTextField(labelText: ''),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen()));
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Your Password?',style:  TextStyle(color: Colors.black,fontSize: 17))
                      ],
                    ),
                  ),
                  const SizedBox(height: 52), // Space before button
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Make button full width
                      child:ElevatedButton.icon(
                        onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF90c43c),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        label:  Text(
                          'Sign In',
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
