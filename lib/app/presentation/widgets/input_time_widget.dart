import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'change_time_button_widget.dart';

class InputTimeWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool readOnly;
  final void Function(String)? onSubmitted;
  final void Function()? inc;
  final void Function()? dec;

  const InputTimeWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.readOnly,
    required this.onSubmitted,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChangeTimeButtonWidget(
                icon: Icons.arrow_downward,
                color: Colors.white,
                onPressed: dec,
              ),
              SizedBox(
                width: 40,
                child: TextField(
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  controller: controller,
                  style: TextStyle(fontSize: 18),
                  onSubmitted: onSubmitted,
                  readOnly: readOnly,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    // Aceitar apenas numeros
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // focusNode: FocusNode(),
                  // autofocus: true,
                  decoration: InputDecoration(
                    // Esconder o contador de palavras
                    counter: SizedBox.shrink(),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              ChangeTimeButtonWidget(
                icon: Icons.arrow_upward,
                color: Colors.white,
                onPressed: inc,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
