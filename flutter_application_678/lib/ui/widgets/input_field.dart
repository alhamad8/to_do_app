import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

import '../size_config.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controllerr,
    this.widgett,
  }) : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controllerr;
  final Widget? widgett;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            margin: const EdgeInsets.only(top: 8),
            width: SizeConfig.screenWidth,
            height: 62,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                // color: primaryClr,
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controllerr,
                  autofocus: false,
                  cursorColor:Get.isDarkMode?Colors.grey[200]:Colors.grey[700] ,
                  readOnly:widgett != null? true:false  ,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subTitleStyle,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0, color: context.theme.backgroundColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 0, color: context.theme.backgroundColor)),
                  ),
                ),
                ),
                widgett ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
