import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NeumorphicButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        depth: 8,
        intensity: 0.65,
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
        color: const Color(0xFFE5E5EA),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: NeumorphicTheme.defaultTextColor(context),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
