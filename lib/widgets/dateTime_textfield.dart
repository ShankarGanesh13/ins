import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeTextfield extends StatefulWidget {
  final String title;
  final ValueChanged onChanged;
  const DateTimeTextfield(
      {super.key, required this.title, required this.onChanged});

  @override
  State<DateTimeTextfield> createState() => _DateTimeTextfieldState();
}

class _DateTimeTextfieldState extends State<DateTimeTextfield> {
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppFonts.w500black14,
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              builder: (BuildContext context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Color(0xff161F31),
                      onPrimary: Colors.white,
                      surface: Colors.white,
                      onSurface: Colors.black,
                    ),
                    dialogBackgroundColor: Colors.white,
                  ),
                  child: child!,
                );
              },
              currentDate: DateTime(1990),
              initialDate: DateTime(2020),
              firstDate: DateTime(1995),
              lastDate: DateTime(2045),
            );
            if (pickedDate != null) {
              String formattedDate =
                  DateFormat("dd-MM-yyyy").format(pickedDate);

              setState(() {
                selectedDate = formattedDate;
              });
              widget.onChanged(pickedDate.millisecondsSinceEpoch.toString());
            } else {}
          },
          child: Container(
            height: 45,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(bottom: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff606060)),
                borderRadius: BorderRadius.circular(3)),
            child: Row(children: [
              selectedDate != null
                  ? Text(
                      selectedDate!,
                      style: AppFonts.w500black14,
                    )
                  : Text(
                      "Select a date",
                      style: AppFonts.w500dark212,
                    ),
              const Spacer(),
              const Icon(
                Icons.calendar_month,
                color: Color(0xff606060),
                size: 20,
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
