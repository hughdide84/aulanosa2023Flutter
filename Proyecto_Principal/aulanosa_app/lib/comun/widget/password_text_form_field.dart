import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.readOnly = false,
    this.initialValue,
    this.passwordController,
    this.visiblePasswordIcon,
    this.obscurePasswordIcon,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction,
    this.style,
    this.decoration,
    this.onSaved,
  });

  final bool readOnly;
  final String? initialValue;

  final Widget? visiblePasswordIcon;
  final Widget? obscurePasswordIcon;
  final TextEditingController? passwordController;
  final ValueChanged<String>? onChanged;

  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final InputDecoration? decoration;
  final FormFieldSetter<String>? onSaved;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final suffixIcon = obscurePassword
        ? widget.obscurePasswordIcon ??
            const Icon(Icons.remove_red_eye_outlined, color: Colors.black)
        : widget.visiblePasswordIcon ??
            const Icon(Icons.remove_red_eye_rounded, color: Colors.black);
    var decoration = InputDecoration(
      suffixIcon: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _togglePasswordVisibility,
        child: UnconstrainedBox(child: suffixIcon),
      ),
    );
    if (widget.decoration != null) {
      decoration = widget.decoration!.copyWith(
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _togglePasswordVisibility,
          child: UnconstrainedBox(child: suffixIcon),
        ),
      );
    }

    return TextFormField(
      style: widget.style,
      readOnly: widget.readOnly,
      initialValue: widget.initialValue,
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscurePassword,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      decoration: decoration,
      onSaved: widget.onSaved,
      /* decoration: InputDecoration(
        errorText: widget.errorMessage,
        labelText: widget.labelText,
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _togglePasswordVisibility,
          child: UnconstrainedBox(child: suffixIcon),
        ),
      ),*/
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}
