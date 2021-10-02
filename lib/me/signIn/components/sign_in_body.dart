import 'package:flutter/material.dart';
import '../../signUp/sign_up_screen.dart';
import '../../../config/constants.dart';
import '../../../config/size_config.dart';
import './sign_in_form.dart';
import '../../../components/social_card.dart';
import '../../../components/ask_button.dart';

class SignInBody extends StatelessWidget {
  SignInBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context).settings.arguments as Map;
    print(" body ${params['id']} ${params['data']}");
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Sign in with your email and password',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Text(
                  'Or',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                SizedBox(height: 20),
                Text(
                  'Continue with',
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                        icon: 'assets/icons/google-icon.svg', press: () {}),
                    SocialCard(
                        icon: 'assets/icons/facebook-2.svg', press: () {}),
                    SocialCard(icon: 'assets/icons/twitter.svg', press: () {}),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                AskButton(
                    ask: 'Dont\'t have an account? ',
                    text: 'Sign Up',
                    press: () => Navigator.of(context)
                        .pushNamed(SignUpScreen.routeName)),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
