import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipiapp/components/textcomp.dart';
import 'package:recipiapp/backend/auth_service.dart';

class CreateAccountt extends StatefulWidget {
  const CreateAccountt({super.key});

  @override
  State<CreateAccountt> createState() => _CreateAccounttState();
}

class _CreateAccounttState extends State<CreateAccountt> {
  late bool _passwordVisible;
  bool? isChecked = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFD77E15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Text(
                      "Your Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF444141), // #444141
                      Color(0xFF1D1C1C), // #1D1C1C
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        child: Column(children: [
                          TextField(
                            controller:
                                _nameController, // Use the new controller for name
                            decoration:
                                PrimaryTextComponent(MyHintText: "Name"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration:
                                PrimaryTextComponent(MyHintText: "Email"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration:
                                PrimaryTextComponent(MyHintText: "Password"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: !_passwordVisible,
                            decoration: PrimaryTextComponent(
                                MyHintText: "Confirm Password"),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  checkColor: Colors.black,
                                  activeColor: Colors.white,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Terms & Condition',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF1976D2),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 48),
                                  child: RichText(
                                    text: TextSpan(
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFFD77E15),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: screenHeight * 0.08, // Adjusted height
                            width: screenWidth * 0.8, // Adjusted width
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFD77E15)),
                            child: Center(
                              child: TextButton(
                                onPressed: () async {
                                  String result =
                                      await AuthService().registerUser(
                                    _emailController.text,
                                    _passwordController.text,
                                    _nameController.text, // Pass the name here
                                  );
                                  if (result == "Registration Successful") {
                                    // Navigate to the next screen or show a success message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Registration Successful"),
                                      ),
                                    );
                                  } else {
                                    // Show an error message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Registration Failed: $result"),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: screenHeight * 0.08, // Adjusted height
                            width: screenWidth * 0.8, // Adjusted width
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFD77E15)),
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, left: 20),
                                    child: Image(
                                        image: AssetImage("images/google.png")),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Sign Up with Google",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an Account?",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print("signin pressed");
                                },
                                child: Text(
                                  " Sign In",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
