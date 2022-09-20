import 'package:ecommercecourse/core/constant/app_routes.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/cusrom_forget_password.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sign_with.dart';
import 'package:ecommercecourse/view/widget/auth/custom_or_divider.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, right: 20, left: 20, bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(AppImageAsset.logo),
                  ),
                  const SizedBox(height: 25.0),
                  const CustomAuthTitle(title: "Let's sign in", fontSize: 24.0),
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomSubTitle(
                        subtitle:
                            'Sign with your email and password or continue with social media'),
                  ),
                  const SizedBox(height: 40.0),
                  const CustomTextFormAuth(
                    hintText: 'Enter email address',
                    icon: Icons.email_rounded,
                  ),
                  const SizedBox(height: 15),
                  const CustomTextFormAuth(
                    hintText: 'Enter password',
                    isSecure: true,
                    icon: Icons.lock_rounded,
                  ),
                  const SizedBox(height: 5.0),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: CustomForgetPassword(),
                  ),
                  const Spacer(),
                  const CustomPrimaryButton(buttonText: 'Sign In'),
                  const CustomOrDivider(text: 'or Sign In with'),
                  const Padding(
                    padding: EdgeInsets.only(top: 22, bottom: 18.0),
                    child: CustomSignWith(),
                  ),
                  GuidanceText(
                    title: "I don't have an account",
                    tapText: 'Sign Up',
                    onTap: () {
                      Get.toNamed(AppRoute.signUp);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
