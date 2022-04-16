import 'package:flutter/material.dart';

Widget defaultFormField ({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix ,
  IconData? suffix ,
  Function? suffixPressed,
  bool isClickable=true,


  bool isPassword = false,

})

=> TextFormField(
  controller: controller ,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,

  decoration: InputDecoration(
    // prefixIcon: Icon(
    //   prefix,
    // ),
    // suffixIcon: suffix !=null ? IconButton(
    //   onPressed: SuffixPressed,
    //   icon: Icon(
    //     suffix,
    //   ),
    // ) : null ,

    labelText: label,

    border:const OutlineInputBorder(),
  ) ,
  validator:validate,
);