import 'package:ecommercecourse/controller/reset_password_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_text_form_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: Image.asset(
                    AppImageAsset.resetPassword,
                    color: AppColor.primaryColor,
                    height: 90,
                    width: 90,
                  ),
                ),
                const Spacer(),
                CustomAuthTitle(title: '35'.tr),
                const SizedBox(height: 15),
                CustomSubTitle(
                  subtitle: '36'.tr,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                CustomTextFormAuth(
                  hintText: '37'.tr,
                  icon: Icons.lock_rounded,
                  isSecure: true,
                  controller: controller.newPasswordField,
                ),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  hintText: '38'.tr,
                  icon: Icons.lock_rounded,
                  isSecure: true,
                  controller: controller.confirmPasswordField,
                ),
                const Spacer(flex: 3),
                CustomPrimaryButton(
                  bottomPadding: 20.0,
                  topPadding: 0.0,
                  buttonText: '39'.tr,
                  onPressed: () {
                    controller.resetPassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}