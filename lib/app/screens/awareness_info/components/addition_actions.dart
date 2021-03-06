import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/screens/awareness_info/controllers/awareness_info_controller.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class AdditionActions extends GetView<AwarenessInfoController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.share,
            color: ColorUtil.mediumGrey,
            size: 20.0,
          ),
          onPressed: () async {
            await Share.share(
              'Check out this ${videosUrl + controller.article?.links ?? imagesUrl + controller.article?.image} \n Careve, because we care :)',
              subject: 'Careve, because we care :)',
            );
          },
        ),
        // IconButton(
        //   icon: const Icon(
        //     FontAwesomeIcons.solidBookmark,
        //     color: ColorUtil.mediumGrey,
        //     size: 20.0,
        //   ),
        //   onPressed: () {
        //     //Todo save
        //   },
        // ),
      ],
    );
  }
}
