import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/models/form_model/sign_in_form_model.dart';
import 'package:shamo/shared/method.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/buttons.dart';
import 'package:shamo/view/widgets/forms.dart';

import '../../blocs/auth/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
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
                  CustomTextButton(
                    text1: 'Don\'t have an account? ',
                    text2: 'Sign up',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/sign-up',
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
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
            'Login',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 2),
          Text('Sign In to Countinue', style: greyTextStyle)
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50,
      ),
      child: Column(
        children: [
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
            title: 'Sign In',
            onPressed: () {
              if (validate()) {
                context.read<AuthBloc>().add(
                      AuthLogin(
                        SignInFormModel(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    );
              } else {
                showSnackbar(context, 'Email Atau Password Tidak Boleh Kosong');
              }
            },
          ),
        ],
      ),
    );
  }
}
