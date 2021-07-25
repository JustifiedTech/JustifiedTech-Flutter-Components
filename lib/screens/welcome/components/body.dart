import 'package:flutter/material.dart';
import '../../../config/size_config.dart';
import '../../../config/constants.dart';
import './welcome_content.dart';
import '../../../components/button.dart';
import '../../../components/ask_button.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  List<Map<String, String>> splashData = [
    {
      'text': 'Welcome to Justified Store, Let\'s Shop!',
      'image': 'assets/images/splash_1.png'
    },
    {
      'text': 'Let\'s take care of your shopping',
      'image': 'assets/images/splash_2.png'
    },
    {
      'text': 'Shopping made easy with us',
      'image': 'assets/images/splash_3.png'
    },
  ];
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
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
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
                            splashData.length, (index) => buildDot(index)),
                      ),
                      Spacer(flex: 3),
                      Button(
                        text: 'Get Started',
                        press: () {},
                      ),
                      AskButton(
                        ask: 'Already have an account?',
                        text: 'Sign In',
                        press: () {},
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

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentIndex == index ? 20 : 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
