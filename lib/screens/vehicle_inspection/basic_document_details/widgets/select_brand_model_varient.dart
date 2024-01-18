import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar_inspection/models/brand_model.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class SelectBrandModelVarient extends StatefulWidget {
  final ValueChanged brandOnChanged;
  final ValueChanged modelOnChanged;
  final ValueChanged varientOnChanged;

  const SelectBrandModelVarient(
      {super.key,
      required this.brandOnChanged,
      required this.modelOnChanged,
      required this.varientOnChanged});

  @override
  State<SelectBrandModelVarient> createState() =>
      _SelectBrandModelVarientState();
}

class _SelectBrandModelVarientState extends State<SelectBrandModelVarient> {
  String? selectedBrand;
  String? selectedModel;
  String? selectedVarient;
  List<Varient> varients = [];
  List<Model> models = [];
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            "Brand ",
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
      FutureBuilder<List<BrandModelVarient>>(
          future: GetBasicDetails.getBrandModelVarient(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration.collapsed(
                  hintText: "Select a brand",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3.0),
                    ),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                hint: Text(
                  "Select a brand",
                  style: AppFonts.w500dark212,
                ),
                value: selectedBrand,
                items: snapshot.data!
                    .map((item) => DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name, style: AppFonts.w500black14),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return "Enter valid data";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedModel = null;
                    selectedVarient = null;
                    selectedBrand = value;
                    widget.brandOnChanged(value);
                    // Provider.of<DealerUploadCar>(context, listen: false)
                    //     .getBrandId(brandName: selectedBrand.toString());
                    models = snapshot.data!
                        .firstWhere((element) => element.name == value)
                        .models;
                  });
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
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.all(0),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
      const SizedBox(
        height: 25,
      ),
      ////////////////////////////////
      ///model
      Row(
        children: [
          Text(
            "Model ",
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
      DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration.collapsed(
          hintText: "Select a model",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        hint: Text(
          "Select a model",
          style: AppFonts.w500dark212,
        ),
        value: selectedModel,
        items: models
            .map((item) => DropdownMenuItem(
                  value: item.name,
                  child: Text(item.name, style: AppFonts.w500black14),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Enter valid data";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            selectedVarient = null;
            selectedModel = value;
            widget.modelOnChanged(value);
            // Provider.of<DealerUploadCar>(context, listen: false)
            //     .getModelId(modelName: selectedModel!.toString());
            varients =
                models.firstWhere((element) => element.name == value).varients;
          });
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
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.all(0),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
      ////////////////////////
      ///varient
      Row(
        children: [
          Text(
            "Varient ",
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
        height: 10,
      ),
      DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration.collapsed(
          hintText: "Select a value",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(3.0),
            ),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        hint: Text(
          "Select a varient",
          style: AppFonts.w500dark212,
        ),
        value: selectedVarient,
        items: varients
            .map((item) => DropdownMenuItem(
                  value: item.name,
                  child: Text(item.name, style: AppFonts.w500black14),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Enter valid data";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            selectedVarient = value;
            widget.varientOnChanged(value);
            // Provider.of<DealerUploadCar>(context, listen: false)
            //     .getVarientId(varientName: selectedVarient.toString());
          });
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
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.all(0),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}
