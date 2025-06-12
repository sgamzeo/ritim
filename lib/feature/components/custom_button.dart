import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritim/product/base/base_stateless_widget.dart';

class CustomButton extends BaseStatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
  });

  final String text;
  final void Function()? onTap;

  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.grey.shade200,
        foregroundColor: textColor ?? Colors.black87,
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      child: Text(text),
    );
  }
}
