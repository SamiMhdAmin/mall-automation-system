import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LanguageSwitcherWidget extends StatefulWidget {
  const LanguageSwitcherWidget({required this.context, super.key});
  final BuildContext context;
  @override
  State<LanguageSwitcherWidget> createState() => _LanguageSwitcherWidgetState();
}

class _LanguageSwitcherWidgetState extends State<LanguageSwitcherWidget> {
  late bool switchValue;
  @override
  void initState() {
    widget.context.locale == const Locale('ar', 'SA')
        ? switchValue = false
        : switchValue = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 250.w,
      height: 130.h,
      valueFontSize: 15.sp,
      toggleSize: 100.h,
      value: switchValue,
      borderRadius: 100.r,
      padding: 0,
      showOnOff: false,
      activeIcon: Text(
        'EN',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 8.sp),
      ),
      inactiveIcon: Text(
        'AR',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 8.sp),
      ),
      activeColor: Colors.white,
      inactiveColor: Colors.white,
      toggleColor: Colors.orange,
      switchBorder: Border.all(color: Colors.orange),
      onToggle: (val) {
        setState(() {
          switchValue = val;
        });
        val == true
            ? widget.context.setLocale(Locale('en', 'US'))
            : widget.context.setLocale(Locale('ar', 'SA'));
      },
    );
  }
}
