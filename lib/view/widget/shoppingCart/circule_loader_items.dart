import 'package:ecommercecourse/controller/ShoppingCart/index.dart';
import 'package:ecommercecourse/core/shared/cirular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ShoppingCardProgressLoaderItems extends GetView<ShoppringCartController> {
  const ShoppingCardProgressLoaderItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppringCartController>(
      id: "loader",
      builder: (con) {
        if (controller.statusLoadingItems.isLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CustomProgressIndicator(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
