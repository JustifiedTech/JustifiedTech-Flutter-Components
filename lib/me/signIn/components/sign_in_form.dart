import 'package:flutter/material.dart';
import '../../../components/form_error.dart';
import '../../../components/button.dart';
import '../../../config/size_config.dart';
import '../../../config/constants.dart';
import '../../forgot_password/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    Key key,
  }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  void submit() {
    final _formState = _formKey.currentState;

    if (_formState.validate()) {
      _formState.save();
    }
  }

  mailvalidator() {}

  final List<String> emailErrors = [];
  final List<String> passwordErrors = [];

  String email, password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailFormField(),
            SizedBox(height: getProportionateScreenHeight(5)),
            FormError(
              errors: emailErrors,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            passwordFormField(),
            SizedBox(height: getProportionateScreenHeight(5)),
            FormError(
              errors: passwordErrors,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  onChanged: (val) {
                    setState(() {
                      remember = val;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      remember = !remember;
                    });
                  },
                  child: Text(
                    'Remeber Me',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: remember == true ? kPrimaryColor : kTextColor),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        decoration: TextDecoration.combine([
                          TextDecoration.underline,
                        ])),
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Button(
              press: submit,
              text: 'Contine',
              icon: Icons.login,
            ),
          ],
        ));
  }

  TextFormField passwordFormField() {
    return TextFormField(
        validator: (val) {
          if (val.isEmpty && !passwordErrors.contains(kPassNullError)) {
            setState(() {
              passwordErrors.add(kPassNullError);
            });
          } else if (val.length < 8 &&
              !passwordErrors.contains(kShortPassError)) {
            setState(() {
              passwordErrors.add(kShortPassError);
            });
          }
          return null;
        },
        onChanged: (val) {
          if (val.isNotEmpty && passwordErrors.contains(kPassNullError)) {
            setState(() {
              passwordErrors.remove(kPassNullError);
            });
          } else if (val.length >= 8 &&
              passwordErrors.contains(kShortPassError)) {
            setState(() {
              passwordErrors.remove(kShortPassError);
            });
          }
          return null;
        },
        onSaved: (newValue) => password = newValue,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your Password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(Icons.lock),
            prefixIcon: Icon(Icons.lock)));
  }

  TextFormField emailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        labelText: 'Email',
        hintText: 'Enter your Email',
        suffixIcon: Icon(Icons.mail),
      ),
      validator: (val) {
        if (val.isEmpty && !emailErrors.contains(kEmailNullError)) {
          setState(() {
            emailErrors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(val) &&
            !emailErrors.contains(kInvalidEmailError)) {
          setState(() {
            emailErrors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      onChanged: (val) {
        if (val.isNotEmpty && emailErrors.contains(kEmailNullError)) {
          setState(() {
            emailErrors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(val) &&
            emailErrors.contains(kInvalidEmailError)) {
          setState(() {
            emailErrors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      onSaved: (newValue) => email = newValue,
    );
  }
}
