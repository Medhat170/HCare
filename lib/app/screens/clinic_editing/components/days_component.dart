import 'package:careve/app/models/clinic_model.dart';
import 'package:careve/app/screens/clinic_editing/controllers/clinic_editing_controller.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DaysComponents extends GetView<ClinicEditingController> {
  @override
  Widget build(BuildContext context) {
    final weekDays = <String>[
      S.current.sat,
      S.current.sun,
      S.current.mon,
      S.current.tue,
      S.current.wed,
      S.current.thu,
      S.current.fri,
    ];
    final weekEnglishDays = <String>[
      "Sat",
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
    ];
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).days,
            style: TextStyle(
              fontSize: 40.sp,
              color: ColorUtil.mediumGrey,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ...List.generate(
            weekDays.length,
            (dayIndex) {
              final Day targetDay = controller.clinic?.value?.days?.firstWhere(
                (element) => element?.day == weekEnglishDays[dayIndex],
                orElse: () => Day(),
              );
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2.5,
                  horizontal: 10.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        weekDays[dayIndex],
                        style: TextStyle(
                          fontSize: 34.sp,
                          color: ColorUtil.blackColor,
                        ),
                      ),
                    ),
                    Text(
                      S.of(context).from,
                      style: TextStyle(
                        fontSize: 34.sp,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          final result = await AppUtil.pickTime(
                            helpText: S.of(context).startTimeSet,
                          );
                          if (result != null) {
                            controller.changeDay(
                              day: weekEnglishDays[dayIndex],
                              startTime: result,
                            );
                          }
                        },
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: AppUtil.borderRadius,
                            color: Colors.white,
                            border: Border.all(
                              color: ColorUtil.mediumGrey,
                              width: 0.5,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                targetDay?.startTime ?? '-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      S.of(context).to,
                      style: TextStyle(
                        fontSize: 34.sp,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          if (targetDay?.startTime == null) {
                            await AppUtil.showAlertDialog(
                              body: S.of(context).nullStartTime,
                            );
                          } else {
                            final result = await AppUtil.pickTime(
                              helpText: S.of(context).endTimeSet,
                            );
                            if (result != null) {
                              controller.changeDay(
                                day: weekEnglishDays[dayIndex],
                                endTime: result,
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: AppUtil.borderRadius,
                            color: Colors.white,
                            border: Border.all(
                              color: ColorUtil.mediumGrey,
                              width: 0.5,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                targetDay?.endTime ?? '-',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 34.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.removeDay(dayIndex),
                      child: Icon(
                        Icons.clear_rounded,
                        color: ColorUtil.errorColor,
                        size: 16.0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
