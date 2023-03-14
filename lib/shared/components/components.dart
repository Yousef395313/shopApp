import 'package:flutter/material.dart';

void NavigateTo(context , widget) =>Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=> widget ,
    )
);
void NavigateToFinish(context ,widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
        builder: (context)=>widget),
        (route) => false);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  // Function? onChange,
  // Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s)=>onSubmit!(s),
      // onChanged: (s){
      //   onChange!(s);
      // },
      //
      // onTap: (){
      //   onTap!();
      // },
      validator: (s) => validate(s),

      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){
            suffixPressed;
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width =double.infinity,
  double height =40.0,
  Color background =Colors.blue,
  required Function function,
  required String? text,
})
=> Container(
  width: width,
  color: background,
  height: height,
  child: MaterialButton(
    onPressed:(){
      function();
    },
    child: Text(
      text!.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultTextButton({
  required Function function,
  required String text,
})
=>
TextButton(
  onPressed: ()
  {
    function();
  },
  child: Text(text),
);