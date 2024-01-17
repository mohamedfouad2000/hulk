import 'package:flutter/material.dart';
import 'package:hulk/core/utils/styles.dart';

// import 'package:ecommers/core/utils/size_config.dart';
// import 'package:ecommers/core/utils/size_config.dart';

Widget defaultButton(
        {required VoidCallback fun,
        required textWidget,
        required double h,
        required double w,
        required Color c}) =>
    InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: h,
        width: w,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: textWidget,
        ),
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        TextInputType type = TextInputType.name,
        required IconData prefixIcon,
        var ontapFun,
        bool enabled = true,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      keyboardType: type,
      decoration: InputDecoration(
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        prefixIcon: Icon(
          prefixIcon,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),

        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required controller,
  TextInputType type = TextInputType.name,
  IconData? preicon,
  bool obscureText = false,
  String val = "",
  var sufficon,
  String? hintText,
  var sufFunction,
  required void Function()? onPressed,
}) =>
    TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "   $val";
        } else {
          return null;
        }
      },
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: StylesData.font12,
        filled: true,
        //Change this value to custom as you like
        // and add this line
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              preicon,
              size: 16,
            ),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),

        // labelText: 'Password',
      ),
    );

// void showToast({
//   required msg,
// }) =>
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: kMainColor,
//         textColor: Colors.white,
//         fontSize: 16.0);

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}
