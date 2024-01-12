import 'package:flikcar_inspection/models/feature_model.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/services/upload_electrical_interior.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentOnElectricalInterior extends StatefulWidget {
  final String type;

  final List<FeatureModel> features;
  const CommentOnElectricalInterior({
    super.key,
    required this.features,
    required this.type,
  });

  @override
  State<CommentOnElectricalInterior> createState() =>
      _CommentOnElectricalInteriorState();
}

class _CommentOnElectricalInteriorState
    extends State<CommentOnElectricalInterior> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.features.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (widget.features[index].isSelected == false) {
                Provider.of<UploadElectricalInteriorService>(context,
                        listen: false)
                    .addCommentsOnEngineTransmission(
                        feature: widget.features[index].name,
                        type: widget.type);
                widget.features[index].isSelected = true;
              } else if (widget.features[index].isSelected == true) {
                widget.features[index].isSelected = false;
                Provider.of<UploadElectricalInteriorService>(context,
                        listen: false)
                    .addCommentsOnEngineTransmission(
                        feature: widget.features[index].name,
                        type: widget.type);
              }
              setState(() {});
              //   print(widget.features[index].isSelected);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 14,
                      width: 14,
                      margin: const EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                          color: widget.features[index].isSelected == true
                              ? Colors.green
                              : Colors.white,
                          border: Border.all(
                            color: widget.features[index].isSelected != true
                                ? Colors.black
                                : Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(2)),
                      child: const Center(
                        child: Icon(Icons.check,
                            size: 12, weight: 2, color: Colors.white),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      widget.features[index].name,
                      style: AppFonts.w500black14,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
