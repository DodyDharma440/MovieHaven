import 'package:flutter/material.dart';

enum ButtonVariant {
  filled,
  outline,
}

class Button extends StatelessWidget {
  final ButtonVariant variant;
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;

  const Button({
    super.key,
    this.variant = ButtonVariant.filled,
    this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  Map<String, dynamic> getStyles(ThemeData theme) {
    switch (variant) {
      case ButtonVariant.outline:
        return {
          "background": Colors.transparent,
          "side": BorderSide(color: theme.primaryColor),
          "textColor": theme.primaryColor,
        };
      case ButtonVariant.filled:
        return {
          "background": theme.primaryColor,
          "side": null,
          "textColor": Colors.white,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    var styles = getStyles(Theme.of(context));

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          side: styles["side"],
          backgroundColor: styles['background'],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: Center(
                  child: CircularProgressIndicator(
                    color: styles['textColor'],
                    strokeWidth: 2,
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: styles["textColor"],
                ),
              ),
      ),
    );
  }
}
