import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/shared/method.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/buttons.dart';
import 'package:shamo/view/widgets/forms.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../models/form_model/sign_up_form_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        usernameController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showSnackbar(context, state.e);
            }

            if (state is AuthSucces) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildBody(context),
                    const Spacer(),
                    _buildSignInButton(context),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 2),
          Text('Register and Happy Shoping', style: greyTextStyle)
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
          CustomFormField(
            title: 'Full Name',
            icon: 'assets/icons/name.png',
            controller: nameController,
          ),
          CustomFormField(
            title: 'Username',
            icon: 'assets/icons/username.png',
            controller: usernameController,
          ),
          CustomFormField(
            title: 'Email Address',
            icon: 'assets/icons/email.png',
            controller: emailController,
          ),
          CustomFormField(
            title: 'Your Password',
            icon: 'assets/icons/password.png',
            isObsecure: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: 'Sign Up',
            onPressed: () {
              if (validate()) {
                authBloc.add(
                  AuthRegister(
                    SignUpFormModel(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      username: usernameController.text,
                    ),
                  ),
                );
              } else {
                showSnackbar(context, 'Something Wrong');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return CustomTextButton(
      text1: 'Already have an account? ',
      text2: 'Sign In',
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
