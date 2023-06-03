import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/widgets/login_form.dart';
import 'package:rive_animation/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  //If we want to show our sign up then we set it true, ez

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate = Tween<double>(
      begin: 0,
      end: 90,
    ).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });

    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    // TODO: implement initState
    super.initState();
  }

  bool _isShowSignUp = false;
  @override
  Widget build(BuildContext context) {
    //that will provide us with screen's height and width
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //animations time
                AnimatedPositioned(
                  duration: defaultDuration,
                  //We'll use 88% width for login
                  //as you can see the logo isn't in the cente,r let's fix it
                  width: _size.width * .88, //88 %
                  left: _isShowSignUp ? -_size.width * 0.76 : 0, //76%
                  height: _size.height,

                  child: InkWell(
                    onTap: () {
                      updateView();
                    },
                    child: Container(
                      color: login_bg,
                      child: LoginForm(),
                    ),
                  ),
                ),

                //sign up

                //and the social icons + logo aren't in the center

                AnimatedPositioned(
                  duration: defaultDuration,
                  //We'll use 88% width for login
                  //as you can see the logo isn't in the cente,r let's fix it
                  width: _size.width * .88,
                  left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                  height: _size.height,
                  child: GestureDetector(
                    onTap: () {
                      _isShowSignUp = !_isShowSignUp;
                    },
                    child: Container(
                      color: signup_bg,
                      child: SignUpForm(),
                    ),
                  ),
                ),
                Positioned(
                  top: _size.height * 0.1, // 10%,
                  right: _isShowSignUp
                      ? -_size.width * 0.06
                      : _size.width * .006, //6%,

                  left: 0,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white60,
                    child: _isShowSignUp
                        ? SvgPicture.asset(
                            'assets/animation_logo.svg',
                            color: signup_bg,
                          )
                        : SvgPicture.asset(
                            "assets/animation_logo.svg",
                            color: login_bg,
                          ),
                  ),
                ),

                //login text

                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _isShowSignUp
                      ? _size.height / 2.6
                      : _size.height * 0.3, //30%
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 80, //
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    duration: const Duration(milliseconds: 2),
                    child: InkWell(
                      onTap: () {
                        signUpFormFieldTapped = !signUpFormFieldTapped;
                        LogInFormFieldTapped = !LogInFormFieldTapped;
                        setState(() {});
                        updateView();
                      },
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: defpaultPadding * 0.75),
                          width: 160,
                          // color: Colors.red,
                          child: Visibility(
                            visible: !LogInFormFieldTapped,
                            child: Text(
                              "Log In".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //signup text

                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isShowSignUp
                      ? _size.height / 2.6
                      : _size.height * 0.3, //30%
                  right: _isShowSignUp ? _size.width * 0.44 - 80 : 0, //
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: !_isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white : Colors.white70,
                    ),
                    duration: const Duration(milliseconds: 2),
                    child: InkWell(
                      onTap: () {
                        signUpFormFieldTapped = !signUpFormFieldTapped;
                        LogInFormFieldTapped = !LogInFormFieldTapped;
                        setState(() {});
                        updateView();
                      },
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: defpaultPadding * 0.75),
                          width: 160,
                          // color: Colors.red,
                          child: Visibility(
                            visible: !signUpFormFieldTapped,
                            child: Text(
                              "Sign Up".toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
