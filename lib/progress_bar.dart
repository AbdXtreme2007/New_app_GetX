import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'questionController.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';

import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionController = Get.put(QuestionController());

    return Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              return Stack(
                children: [
                  if (questionController.timerController != null)
                    // LayoutBuilder provide us the available space for the conatiner
                    // constraints.maxWidth needed for our animation
                    AnimatedBuilder(
                      animation: questionController.timerController,
                      builder: (context, child) {
                        return Text(
                          'Time remaining: ${(1.0 - questionController.timerController.value) * 60} seconds',
                          style: TextStyle(fontSize: 20),
                        );
                        //    Positioned.fill(
                        //    child: Padding(
                        //    padding: const EdgeInsets.symmetric(
                        //      horizontal: kDefaultPadding / 2),
                        //  child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // children: [
                        //  Text(
                        //   'Time remaining: ${(1.0 - controller.animation.value) * 60} seconds',
                        //  ),
                        //  SvgPicture.asset("assets/icons/clock.svg"),
                        // ],
                        // ),
                        // ),
                        //    ),
                      },
                    ),
                ],
              );
            }));
  }
}
