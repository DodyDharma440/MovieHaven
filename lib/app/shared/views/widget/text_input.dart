import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextInput extends StatefulWidget {
  final String name;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String? errorText;
  final Function(String?)? onChanged;
  final Function()? onEditingComplete;
  final Widget? prefixIcon;

  const TextInput(
      {super.key,
      required this.name,
      required this.label,
      this.isPassword = false,
      this.validator,
      this.errorText,
      this.onChanged,
      this.onEditingComplete,
      this.prefixIcon});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: widget.isPassword ? !_isShowPassword : false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        label: Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white60,
          ),
        ),
        errorText: widget.errorText == "" ? null : widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white38,
          ),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? Container(
                width: 40,
                margin: const EdgeInsets.only(right: 16, left: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    setState(() {
                      _isShowPassword = !_isShowPassword;
                    });
                  },
                  child: Icon(
                    _isShowPassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
