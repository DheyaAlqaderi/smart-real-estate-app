import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_real_estate_app/src/services/use_case/UserAuthCase.dart';


final _fromKey = GlobalKey<FormState>();

class login_screen extends StatefulWidget {
  const login_screen({
    super.key,
  });

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final UserAuthCase _authUseCase = UserAuthCase();

  String? validateEmail(String? email) {
    // Regular expression for email validation
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

    if (email!.isEmpty) {
      return 'Please enter an email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }

    return null; // Return empty string if email is valid
  }


  @override
  void initState() {
    super.initState();
    _authUseCase.setOnLoadingStateChanged(() {
      setState(() {
        // Refresh the UI when the loading state changes
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: _fromKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email', // Arabic: 'Email'
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: validateEmail,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "password", // Arabic: 'Password'
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (password) => (password!.isEmpty)? 'please fill the password': null,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_fromKey.currentState!.validate()){
                          _authUseCase.login(
                            context,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F4C6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: _authUseCase.isLoading
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                          : Text(
                        'تسجيل',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'هل نسيت كلمة المرور',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter'
                      ),

                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'او',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 158.50,
                          height: 70,
                          padding: const EdgeInsets.only(top: 22, bottom: 23),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F4F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 25,
                                        height: 25,
                                        child:
                                        SvgPicture.asset("assets/images/google-icon.svg")
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 158.50,
                          height: 70,
                          padding: const EdgeInsets.only(top: 22, bottom: 23),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF5F4F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 25,
                                        height: 25,
                                        child:
                                        SvgPicture.asset(
                                          "assets/images/facebook-icon.svg",
                                          height: 25,
                                          width: 25,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}