import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar_inspection/screens/upcoming_inspection/widgets/upcoming_inspection_card.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class UpcomingInspection extends StatefulWidget {
  const UpcomingInspection({super.key});

  @override
  State<UpcomingInspection> createState() => _UpcomingInspectionState();
}

class _UpcomingInspectionState extends State<UpcomingInspection> {
  List<String> items = ["Today", "Tomorrow", "All"];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: CustomAppbar(),
      ),
      body: Column(
        children: [
          Container(
            height: 55,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(22, 31, 49, 0.10),
                Color.fromRGBO(69, 192, 141, 0.10)
              ],
            )),
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Color(0xff45C08D),
                ),
              ),
              Text(
                "Upcoming Inspections",
                style: AppFonts.w700black16,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Inspections :  ",
                      style: AppFonts.w700black14,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text('All', style: AppFonts.w700black14),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child:
                                      Text(item, style: AppFonts.w700black14),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          // decoration:
                          //     BoxDecoration(border: Border(bottom: BorderSide())),
                          height: 40,
                          width: 105,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return UpcomingInspectionCard();
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 25,
                      );
                    },
                    itemCount: 3),
                const Divider(
                  height: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
