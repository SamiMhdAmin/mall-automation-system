import 'package:flutter/material.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';

/// Flutter code sample for [showTimePicker].

class TimePickerOptions extends StatefulWidget {
  const TimePickerOptions({
    super.key,
    required this.themeMode,
    required this.useMaterial3,
  });

  final ThemeMode themeMode;
  final bool useMaterial3;

  @override
  State<TimePickerOptions> createState() => _TimePickerOptionsState();
}

class _TimePickerOptionsState extends State<TimePickerOptions> {
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial; //input
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Open time',
      onPressed: () async {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
          initialEntryMode: entryMode,
          orientation: orientation,
          builder: (BuildContext context, Widget? child) {
            // We just wrap these environmental changes around the
            // child in this builder so that we can apply the
            // options selected above. In regular usage, this is
            // rarely necessary, because the default values are
            // usually used as-is.
            return Theme(
              data: Theme.of(context).copyWith(
                materialTapTargetSize: tapTargetSize,
              ),
              child: Directionality(
                textDirection: textDirection,
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: use24HourTime,
                  ),
                  child: child!,
                ),
              ),
            );
          },
        );
        setState(() {
          selectedTime = time;
        });
      },
    );
  }
}
