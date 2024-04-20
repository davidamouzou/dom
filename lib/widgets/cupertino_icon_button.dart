import 'package:flutter/cupertino.dart';

class CupertinoIconButton extends StatelessWidget {
  final Widget icon;
  final Function()? onTap;
  const CupertinoIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray.withOpacity(.8),
          border: Border.all(
            width: 0.2,
            color: CupertinoColors.lightBackgroundGray,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: icon,
      ),
    );
  }
}
