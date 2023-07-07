import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/color_manager.dart';
import '../page/register_page.dart';

class StringToSignUp extends StatelessWidget {
  const StringToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(
            color: ColorManager.foregroundL,
            fontSize: 25.sp,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ),
            );
          },
          child: Text(
            "SIGN UP",
            style: TextStyle(
              letterSpacing: 1.5,
              color: ColorManager.blue,
              fontSize: 25.sp,
            ),
          ),
        ),
      ],
    );
  }
}
