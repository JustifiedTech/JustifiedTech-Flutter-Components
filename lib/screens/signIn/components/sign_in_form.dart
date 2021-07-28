import 'package:flutter/material.dart';
import '../../../components/form_error.dart';
import 'package:justifiedtech/components/button.dart';
import '../../../config/size_config.dart';
import '../../../config/constants.dart';

class SignForm extends StatefulWidget {
  const SignForm({
    Key key,
  }) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  void validator() {}

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email, password;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailFormField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            passwordFormField(),
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
                        color: remember == true ? kPrimaryColor : kTextTheme),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
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
            FormError(errors: errors),
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
          if (val.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          } else if (val.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
          }
          return null;
        },
        onChanged: (val) {
          if (val.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              errors.remove(kPassNullError);
            });
          } else if (val.length >= 8 && errors.contains(kShortPassError)) {
            setState(() {
              errors.remove(kShortPassError);
            });
          }
          return null;
        },
        onSaved: (newValue) => password = newValue,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your Password',
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
        if (val.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(val) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      onChanged: (val) {
        if (val.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(val) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      onSaved: (newValue) => email = newValue,
    );
  }
}
