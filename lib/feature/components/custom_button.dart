import 'package:ritim/feature/components/custom_button_controller.dart';
import 'package:ritim/product/base/base_get_view.dart';
import 'package:ritim/product/components/scale_factor_autosize_text.dart';
import 'package:ritim/product/constants/app_border_radius.dart';
import 'package:ritim/product/constants/app_colors.dart';
import 'package:ritim/product/constants/app_padding.dart';

class CustomButton extends BaseGetView<CustomButtonController> {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;

  CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = AppColors.white,
    this.textColor = AppColors.primaryColor,
    this.borderRadius,
    this.padding,
    required String controllerTag,
  }) : super(controllerTag: controllerTag) {
    Get.lazyPut<CustomButtonController>(
      () => CustomButtonController(),
      tag: controllerTag,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTapDown: (_) => controller.onTapDown(),
        onTapUp: (_) {
          controller.onTapUp();
          onTap?.call();
        },
        onTapCancel: () => controller.onTapCancel(),
        child: Transform.scale(
          scale: controller.scale.value,
          child: _buildButtonContainer(),
        ),
      ),
    );
  }

  Widget _buildButtonContainer() {
    return Container(
      padding: padding ?? AppPadding.small,
      decoration: _buildBoxDecoration(),
      child: _buildButtonText(),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius ?? AppBorderRadius.small,
    );
  }

  Widget _buildButtonText() {
    return Center(
      child: ScaleFactorAutoSizeText(
        text: text,
        style: theme.primaryTextTheme.bodyLarge?.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
