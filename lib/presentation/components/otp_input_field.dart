import 'package:flutter/material.dart';
import 'package:aisight_app/constants/colors.dart';

class OtpInputField extends StatefulWidget {
  final int length;
  final double fieldWidth;
  final double fieldHeight;
  final Function(String) onChanged;

  const OtpInputField({
    Key? key,
    required this.length,
    this.fieldWidth = 50,
    this.fieldHeight = 60,
    required this.onChanged,
  }) : super(key: key);

  @override
  _OtpInputFieldState createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return Container(
          width: widget.fieldWidth,
          height: widget.fieldHeight,
          decoration: BoxDecoration(
            color: themeColors.shade600,
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              width: 2,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          child: TextFormField(
            controller: _controllers[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index == widget.length - 1) {
                  widget.onChanged(getOtp());
                } else {
                  FocusScope.of(context).nextFocus();
                }
              }
            },
            decoration: const InputDecoration(
              counter: Offstage(),
              border: InputBorder.none,
            ),
          ),
        );
      }),
    );
  }

  String getOtp() {
    String otp = '';
    _controllers.forEach((controller) {
      otp += controller.text;
    });
    return otp;
  }
}
