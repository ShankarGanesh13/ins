import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar_inspection/models/rto_model.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class RtoDropdown extends StatelessWidget {
  final ValueChanged selectRto;

  RtoDropdown({super.key, required this.selectRto});
  String? selectedRto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RTO Location *",
          style: AppFonts.w500black14,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<Rto>>(
            future: GetBasicDetails.getRtoLocations(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Select a RTO",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.0),
                      ),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  hint: Text(
                    "Select RTO location",
                    style: AppFonts.w500dark212,
                  ),
                  value: selectedRto,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.rtoName,
                            child: Text("${item.rtoName} ( ${item.rtoCode} )",
                                style: AppFonts.w500black14),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    selectRto(value);
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
        )
      ],
    );
  }
}
