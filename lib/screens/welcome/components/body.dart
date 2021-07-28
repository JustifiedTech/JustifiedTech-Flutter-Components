import 'dart:async';
import 'package:flutter/material.dart';
import 'package:justifiedtech/screens/signIn/sign_in_screen.dart';
import 'package:justifiedtech/screens/signUp/sign_up_screen.dart';
import '../../../config/size_config.dart';
import './build_dot.dart';
import './welcome_content.dart';
import '../../../components/button.dart';
import '../../../components/ask_button.dart';
import './splash_list.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentIndex < 2) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 5000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => WelcomeContent(
                    text: splashData[index]['text'],
                    image: splashData[index]['image'],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length,
                            (index) => BuildDot(
                                currentIndex: _currentIndex, index: index)),
                      ),
                      Spacer(flex: 3),
                      Button(
                        text: 'Get Started',
                        press: () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                      ),
                      Spacer(),
                      AskButton(
                        ask: 'Already have an account?',
                        text: 'Sign In',
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
