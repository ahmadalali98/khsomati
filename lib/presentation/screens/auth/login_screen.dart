import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khsomati/business_logic/cubit/cubit/auth_cubit.dart';
import 'package:khsomati/presentation/widget/text_form_felid.dart';
import 'package:khsomati/router/route_string.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKay = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF004445),
        body: Form(
          key: _formKay,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome To',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          // fontSize: 14,
                          fontSize: w * 0.06,
                          height: 1.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF004445),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Khosomati',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          //fontSize: 22.39 ,
                          fontSize: w * 0.1,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                          letterSpacing: 0,
                          color: Color(0xFF004445),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.1),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Mobile Number',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          // fontSize: 14,
                          fontSize: w * 0.07,
                          height: 1.0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF004445),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    IntlPhoneField(
                      controller: phoneNumber,
                      initialCountryCode: "JO",
                      showDropdownIcon: true,
                      dropdownIconPosition: IconPosition.trailing,
                      invalidNumberMessage: "Invalid phone number",
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        hintText: "Enter your phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(height: h * 0.4),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKay.currentState!.validate()) {
                            context.read<AuthCubit>().sendCode(
                              phone: phoneNumber.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF004445),
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                        ),
                        child: BlocConsumer<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return CircularProgressIndicator(
                                color: Colors.white,
                              );
                            } else {
                              return Text("Login");
                            }
                          },
                          listener: (context, state) {
                            if (state is AuthLogedIn) {
                              Navigator.pushReplacementNamed(
                                context,
                                RouteString.home,
                              );
                            } else if (state is AuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class phoneTextFeld extends StatelessWidget {
  const phoneTextFeld({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
