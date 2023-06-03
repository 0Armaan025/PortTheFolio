import 'package:flutter/material.dart';
import 'package:rive_animation/service/authentication.service.dart';

import '../constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                LogInFormFieldTapped = true;
                setState(() {});
              },
              child: TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
              child: GestureDetector(
                onTap: () {
                  LogInFormFieldTapped = true;
                  setState(() {});
                },
                child: TextFormField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_passwordController.text == "") {
                  showAwesomeSnackBar(context, "Fields not filled!",
                      "Please fill all the respective fields!");
                } else {
                  AuthenticationService().signIn(
                      context, _emailController.text, _passwordController.text);
                }
              },
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: signup_bg,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                    fontSize: 14,
                    // fontWeight: FontWeight.,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
