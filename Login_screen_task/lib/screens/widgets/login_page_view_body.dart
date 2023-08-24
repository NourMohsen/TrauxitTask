
import 'package:flutter/material.dart';
import 'package:login_screen_task/screens/home_screen.dart';
import 'package:login_screen_task/screens/widgets/show_snack_bar.dart';
import 'custom_button.dart';
import 'custom_textform_field.dart';


class LoginPageViewBody extends StatefulWidget {
  const LoginPageViewBody({Key? key}) : super(key: key);

  @override
  State<LoginPageViewBody> createState() => _LoginPageViewBodyState();
}

class _LoginPageViewBodyState extends State<LoginPageViewBody> {
  bool isLoading = false;
  bool isObSecure = true;


  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                "Sign In",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up!",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              CustomTextFormField(
                onTap: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                onPress: (){
                  setState(() {
                    isObSecure = !isObSecure;
                  });
                },
                icon: isObSecure?Icons.remove_red_eye:Icons.visibility_off,
                isObscure: isObSecure,
                onTap: (data) {
                  password = data;
                },
                hintText: 'Password',

              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              CustomButon(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>const TabBarScreen()));
                      showSnackBar(context, 'Welcome,to home screen.');
                    } catch (ex) {
                      showSnackBar(context, 'there was an error');
                    }
                    isLoading = false;
                    setState(() {});
                  } else {}
                },
                text: 'LOGIN',
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
