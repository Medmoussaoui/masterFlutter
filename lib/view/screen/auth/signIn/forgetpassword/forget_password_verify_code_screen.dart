import 'package:ecommercecourse/controller/ForgetPassword/verify_code_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/image_asset.dart';
import 'package:ecommercecourse/core/functions/alert_confirm_dialog.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:ecommercecourse/core/shared/custom_primary_button.dart';
import 'package:ecommercecourse/view/widget/auth/custom_auth_title.dart';
import 'package:ecommercecourse/view/widget/auth/custom_sub_title.dart';
import 'package:ecommercecourse/view/widget/auth/guidance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgetPasswordVerifyCodeScreen extends StatelessWidget {
  const ForgetPasswordVerifyCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgetPasswordVerifyCodeController>();
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool state = await customalertDialogSimpleConfirm(
            icon: const Icon(
              Icons.backspace_outlined,
              color: Colors.red,
              size: 30,
            ),
            title: "Attention",
            subTitle: "If you back you will discard Reset Password process",
            confirmText: "Back",
          );
          return state;
        },
        child: SingleChildScrollView(
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
                      AppImageAsset.email,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const Spacer(),
                  GetBuilder<ForgetPasswordVerifyCodeController>(
                      builder: (con) {
                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      opacity: con.statusRequest.isLoading ? 0.4 : 1.0,
                      child: Column(
                        children: [
                          CustomAuthTitle(title: '30'.tr),
                          const SizedBox(height: 15),
                          CustomSubTitle(
                            subtitle: '31'.tr + ("\n ${con.email}"),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40.0),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: OtpTextField(
                              enabled: !con.statusRequest.isLoading,
                              fieldWidth: 50,
                              textStyle: const TextStyle(fontSize: 13),
                              numberOfFields: 4,
                              showFieldAsBox: true,
                              borderRadius: BorderRadius.circular(10.0),
                              fillColor: AppColor.grey.withOpacity(0.01),
                              filled: true,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 7.0),
                              keyboardType: TextInputType.phone,
                              onSubmit: (code) => controller.onVerify(code),
                            ),
                          ),
                          const SizedBox(height: 22.0),
                          GuidanceText(
                            title: "32".tr,
                            tapText: '33'.tr,
                            onTap: () {
                              controller.resendCode();
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const Spacer(flex: 3),
                  GetBuilder<ForgetPasswordVerifyCodeController>(
                      builder: (con) {
                    return Opacity(
                      opacity: con.statusRequest.isLoading ? 0.9 : 1.0,
                      child: CustomPrimaryButton(
                        bottomPadding: 20.0,
                        topPadding: 0.0,
                        buttonText: '34'.tr,
                        onPressed: () => controller.onVerify(null),
                        child: con.statusRequest.isLoading
                            ? const CustomProgressIndicator(color: Colors.white)
                            : null,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
