// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testarget/core/ui/const_colors.dart';
import 'package:testarget/core/ui/text_styles.dart';

enum TextFormFieldType {
  primary,
  secondary,
}

class CustomTextFormField extends FormField<String> {
  final String labelText;
  final TextEditingController? controller;
  final TextInputType formFieldType;
  final String? Function(String?)? validators;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enable;
  final Color? fillColor;
  final bool autofocus;
  final bool obscureText;
  final VoidCallback? toggleObscureText;
  final AutovalidateMode validadeMode;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool withBorder;
  final TextFormFieldType type;
  final int? maxLines;
  final int? minLines;
  final String? initialText;
  final bool isCollapsed;
  final int? maxLength;
  final Function(String)? onFieldSubmitted;

  CustomTextFormField({
    Key? key,
    required this.labelText,
    this.controller,
    this.formFieldType = TextInputType.text,
    this.validators,
    this.onEditingComplete,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
    this.fillColor,
    this.autofocus = false,
    this.obscureText = false,
    this.toggleObscureText,
    this.validadeMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.focusNode,
    this.withBorder = true,
    this.type = TextFormFieldType.primary,
    this.maxLines = 1,
    this.minLines = 1,
    this.initialText,
    this.isCollapsed = false,
    this.maxLength = 20,
    this.onFieldSubmitted,
  }) : super(
          key: key,
          builder: (field) {
            return Row(
              children: [
                Expanded(
                  child: TextFormField(
                    focusNode: focusNode,
                    inputFormatters: inputFormatters,
                    controller: controller,
                    initialValue: initialText,
                    enabled: enable,
                    keyboardType: formFieldType,
                    obscureText: obscureText,
                    autovalidateMode: validadeMode,
                    validator: validators,
                    minLines: minLines,
                    onTap: onTap,
                    onEditingComplete: onEditingComplete,
                    onChanged: onChanged,
                    autofocus: autofocus,
                    maxLines: maxLines,
                    cursorColor: ConstColors.blackFull,
                    style: FactoryTextStyles.bodySmall(
                      color: enable || fillColor != null
                          ? ConstColors.black100
                          : ConstColors.black100.withOpacity(
                              0.6,
                            ),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: labelText,
                      labelStyle: FactoryTextStyles.bodySmall(
                        color: type == TextFormFieldType.primary
                            ? ConstColors.black100
                            : ConstColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                      errorStyle: FactoryTextStyles.bodySmall(
                        color: ConstColors.red300,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: fillColor != null || !enable,
                      fillColor: !enable
                          ? fillColor ??
                              ConstColors.primary.withOpacity(
                                0.1,
                              )
                          : fillColor,
                      prefixIcon: prefixIcon,
                      suffixIcon: toggleObscureText != null
                          ? suffixIcon ??
                              _hiddenTextIcon(
                                isObscure: obscureText,
                                onTap: toggleObscureText,
                              )
                          : suffixIcon,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 19,
                      ),
                      enabledBorder: _borderStyle(
                        type: type,
                        withBorder: withBorder,
                      ),
                      disabledBorder: _borderStyle(
                        type: type,
                        withBorder: withBorder,
                      ),
                      focusedBorder: _borderStyle(
                        type: type,
                        withBorder: withBorder,
                        isFocused: true,
                      ),
                      errorBorder: _borderStyle(
                        type: type,
                        withBorder: true,
                        isError: true,
                      ),
                      focusedErrorBorder: _borderStyle(
                        type: type,
                        withBorder: true,
                        isError: true,
                      ),
                      isCollapsed: isCollapsed,
                    ),
                    maxLength: maxLength,
                    onFieldSubmitted: onFieldSubmitted,
                  ),
                ),
              ],
            );
          },
        );
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

InkWell _hiddenTextIcon({
  required bool isObscure,
  required VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 400),
          crossFadeState:
              isObscure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: const Icon(
            Icons.visibility,
            color: ConstColors.black100,
          ),
          secondChild: const Icon(
            Icons.visibility_off,
            color: ConstColors.black100,
          ),
        ),
      ],
    ),
  );
}

InputBorder _borderStyle({
  bool isError = false,
  bool isFocused = false,
  required bool withBorder,
  required TextFormFieldType type,
}) {
  switch (type) {
    case TextFormFieldType.secondary:
      return const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      );
    default:
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: withBorder
            ? BorderSide(
                color: isError
                    ? ConstColors.red300
                    : isFocused
                        ? ConstColors.primary
                        : ConstColors.white300,
              )
            : BorderSide.none,
      );
  }
}

class _CustomTextFormFieldState extends FormFieldState<String> {
  TextEditingController? get _effectiveController => widget.controller;

  @override
  CustomTextFormField get widget => super.widget as CustomTextFormField;

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_handleControllerChanged);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      setValue(widget.controller?.text);
    }
  }

  @override
  void didChange(String? value) {
    super.didChange(value);
    if (_effectiveController!.text != value) {
      _effectiveController!.text = value!;
    }
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController!.text = widget.initialValue!;
    });
  }

  void _handleControllerChanged() {
    if (_effectiveController!.text != value) {
      didChange(_effectiveController!.text);
    }
  }
}
