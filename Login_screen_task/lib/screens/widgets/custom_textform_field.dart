import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText,this.onTap, this.isObscure=false,this.icon, this.onPress,});

  final Function(String)?onTap;
  final String? hintText;
  final bool? isObscure;
  final IconData? icon;
final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:isObscure ?? false ,
      validator: (data){
        if(data!.isEmpty){
          return 'Field is required';
        }

      },
      onChanged: onTap,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black,),
        suffix: GestureDetector(
          onTap: onPress,
            child: Icon(icon,color: Colors.black,)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hintText,


      ),
    );
  }
}
