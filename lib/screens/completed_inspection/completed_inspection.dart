import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/completed_inspection_card.dart';

class CompletedInspection extends StatelessWidget {
  const CompletedInspection({super.key});

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
                "Completed Inspections",
                style: AppFonts.w700black16,
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CompletedInspectionCard();
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 3),
              Divider()
            ]),
          ),
        ],
      ),
    );
  }
}
