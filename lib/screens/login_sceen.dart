import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode focusNode = FocusNode();
  bool isObscure = true;
  var _entedPhoneNumber = '';
  var _enteredPass = '';
  final _formKey = GlobalKey<FormState>();
  var _buttonColor = const Color.fromARGB(255, 203, 203, 203);

  void login() {
    if (_formKey.currentState!.validate()) {}
  }

  void _updateButtonColor() {
    // Update the button color based on your condition
    if (_entedPhoneNumber.isNotEmpty &&
        _enteredPass.isNotEmpty &&
        _formKey.currentState!.validate() == true) {
      setState(() {
        _buttonColor =
            const Color.fromARGB(255, 40, 179, 172); // Set the desired color
      });
    } else {
      setState(() {
        _buttonColor =
            const Color.fromARGB(255, 203, 203, 203); // Set the default color
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Phone number',style: TextStyle(color: ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(left: 9),
                          alignment: AlignmentDirectional.bottomStart,
                          color: Color.fromARGB(221, 99, 99, 99),
                          width: 45,
                          height: 1,
                        ),
                        const CountryCodePicker(
                          boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12))),
                          showDropDownButton: true,
                          textStyle: TextStyle(fontSize: 15),
                          padding: EdgeInsets.all(0),
                          showFlag: false,
                        ),
                      ],
                    ),
                    Expanded(child: TextFormField())
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                TextFormField(
                  onChanged: (value) {
                    _enteredPass = value;
                    _updateButtonColor();
                  },
                  obscureText: isObscure,

                  //focusNode: focusNode,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          size: 20,
                          color: const Color.fromARGB(255, 114, 113, 113),
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        }),
                    labelText: 'Password',
                    // border: const OutlineInputBorder(
                    //   borderSide: BorderSide(),
                    // ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.length < 6) {
                      return 'Please enter a valid Password';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredPass = newValue!;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      backgroundColor: _buttonColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: login,
                    child: const Text('Login', style: TextStyle(fontSize: 20))),
                const SizedBox(
                  height: 4,
                ),
                TextButton(
                    style: const ButtonStyle(
                        alignment: Alignment.bottomRight,
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {},
                    child: const Text(
                      'Foreget password',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}



 // IntlPhoneField(
                //   onSaved: (newValue) {
                //     _entedPhoneNumber = newValue!.completeNumber;
                //   },
                //   validator: (value) {
                //     final RegExp phoneRegex = RegExp(r'^[0-9 ()-]+$');
                //     if (value!.number.isEmpty) {
                //       return 'Please enter a phone number.';
                //     } else if (!phoneRegex.hasMatch(value.completeNumber)) {
                //       return 'Invalid phone number.';
                //     }
                //     return null;
                //   },
                //   focusNode: focusNode,
                //   decoration: const InputDecoration(
                //     labelText: 'Phone Number',
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide(),
                //     ),
                //   ),
                //   languageCode: "en",
                //   onChanged: (phone) {
                //     _entedPhoneNumber = phone.completeNumber;
                //     _updateButtonColor();
                //   },
                // ),