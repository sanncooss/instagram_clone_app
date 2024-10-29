import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';
import 'package:instagram_clone_app/utils/colors.dart';
import 'package:instagram_clone_app/widgets/textfield_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bioController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //svg image (logo)
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              //circular widget to accept and show our selected file
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://avatars.mds.yandex.net/i?id=2bba1b195cab1e5ee480b15f204848b3c5626639-13012864-images-thumbs&n=13',
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              TextfieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: usernameController,
              ),
              SizedBox(
                height: 24,
              ),
              TextfieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.emailAddress,
                textEditingController: bioController,
              ),
              SizedBox(
                height: 24,
              ),
              // Email field
              TextfieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: emailController,
              ),
              SizedBox(
                height: 24,
              ),
              // password field
              TextfieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: passwordController,
                isPassed: true, // for hiding the input text
              ),
              SizedBox(
                height: 24,
              ),
              // Button
              InkWell(
                onTap: () async {
                  String res = await AuthMethods().signUpUser(
                    email: emailController.text,
                    password: passwordController.text,
                    username: usernameController.text,
                    bio: bioController.text,
                    // file: 
                  );
                  print(res);
                },
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              // Signing up screen transitioning
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't you have an account?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text(
                        "sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
