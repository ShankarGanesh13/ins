import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar_inspection/models/color_model.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class SelectColor extends StatelessWidget {
  final ValueChanged selectColor;

  SelectColor({super.key, required this.selectColor});
  String? selectedColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Color ",
              style: AppFonts.w500black14,
            ),
            const Text(
              "*",
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        FutureBuilder<List<ColorModel>>(
            future: GetBasicDetails.getColors(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Select a Color",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  hint: Text(
                    "Select a color",
                    style: AppFonts.w500dark214,
                  ),
                  value: selectedColor,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.color,
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: Color(int.parse(
                                          "0xff${(item.hexCode.toUpperCase().replaceAll("#", ""))}")),
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(item.color, style: AppFonts.w500black14),
                              ],
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectedColor = value;
                    selectColor(value);
                    // Provider.of<DealerUploadCar>(context, listen: false)
                    //     .getColorId(colorName: selectedColor!.toString());
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(
                      left: 0,
                      right: 5,
                    ),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return const SizedBox();
              }
            }),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
