import 'package:flutter/material.dart';
import 'package:twazoon/features/auth/otp/ui/widgets/otp_text_field.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;

  const OtpInput({this.length = 6, this.onChanged, super.key});

  @override
  State<OtpInput> createState() => OtpInputState();
}

class OtpInputState extends State<OtpInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
    for (var controller in _controllers) {
      controller.addListener(_updateOtp);
    }
  }

  void _updateOtp() {
    final otp = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(otp);
  }

  void clearOtpFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
    if (_focusNodes.isNotEmpty) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return OtpTextField(
          index: index,
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) {
            if (value.length == 1 && index < widget.length - 1) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          },
        );
      }),
    );
  }
}