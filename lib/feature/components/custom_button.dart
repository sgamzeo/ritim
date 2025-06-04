import 'package:ritim/product/base/base_stateless_widget.dart';

class CustomButton extends BaseStatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  final String text;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
