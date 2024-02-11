import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/use_case/UserAuthCase.dart';
final _formKey = GlobalKey<FormState>();
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

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
  String? validateYemeniPhoneNumber(String? phoneNumber) {
    // Regular expression for Yemeni phone number validation
    final RegExp phoneRegex = RegExp(r'^009677[3,7,8,1,0]{1}[0-9]{7}$');

    if (phoneNumber!.isEmpty) {
      return 'Please enter a phone number.';
    } else if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Please enter a valid Yemeni phone number';
    }

    return null; // Return empty string if phone number is valid
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


  bool isConditionAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 40.0,),
                    Container(
                      child: Stack(
                         children: [
                           CircleAvatar(
                             radius: 50,
                             backgroundImage: AssetImage('assets/images/me.JPG'),
                             backgroundColor: Colors.white,
                           ),
                           Positioned(
                             right: 0,
                             bottom: 0,
                             child: InkWell(
                               onTap: (){
                                 // Navigator.pop(context);
                               },
                               borderRadius: BorderRadius.circular(25),
                               child: Container(
                                 width: 30,
                                 height: 30,

                                 decoration: ShapeDecoration(
                                   color: Color(0xFF234F68),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(25),
                                   ),
                                   shadows: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.3),
                                       spreadRadius: 2,
                                       blurRadius: 5,
                                       offset: Offset(0, 3),
                                     )
                                   ],
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(5.0),
                                   child: Center(child: SvgPicture.asset('assets/images/pen-icon.svg')),
                                 ),
                               ),
                             ),
                           )
                         ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Dheya Yahya',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF234F68),
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'diaa.alqadrei@gmail.com',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'name', // Arabic: 'Name'
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (name) => (name!.isEmpty)?'please enter your name':null,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: 'phone', // Arabic: 'Phone Number'
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  prefixText: '+967'
                              ),
                              validator: (value) {
                                print(value);
                                final formattedPhoneNumber = "00967$value"; // Remove '+967' before validation
                                print(formattedPhoneNumber);
                                return validateYemeniPhoneNumber(formattedPhoneNumber);
                              },
                            ),
                            SizedBox(height: 20),
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
                                labelText: 'password', // Arabic: 'Password'
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              validator: (password) => (password!.isEmpty)?'please enter a password':null,
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              margin: EdgeInsets.all(5.0),
                              width: double.infinity,
                              height: 58,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    _authUseCase.createAccount(
                                      context,
                                      nameController.text.trim(),
                                      phoneController.text.trim(),
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    );
                                  }


                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF1F4C6B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0), // Corner radius
                                  ),
                                ),
                                child: _authUseCase.isLoading
                                    ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                                    : Text(
                                  'أنشاء حساب',
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
                            SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
