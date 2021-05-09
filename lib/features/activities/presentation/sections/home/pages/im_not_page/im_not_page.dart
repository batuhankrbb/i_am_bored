import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/device_enums.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/utils/screen_information_model.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_app_bar.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_big_text.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../components/custom_text.dart';

class IAmNotBoredPage extends StatefulWidget {
  IAmNotBoredPage({Key? key}) : super(key: key);

  @override
  _IAmNotBoredPageState createState() => _IAmNotBoredPageState();
}

class _IAmNotBoredPageState extends State<IAmNotBoredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(context.padding4),
          child: Column(
            children: [
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 50,
                child: buildBigText(context),
              ),
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 25,
                child: buildMiddleTextWithBorder(),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 8,
                child: buildBottomText(context),
              ),
              Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBigText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding12),
      child: CustomBigText(texts: ["Yey!", "that is", "great news"]),
    );
  }

  CustomAutoSizeText buildBottomText(BuildContext context) {
    return CustomAutoSizeText(
      text: "Please don't delete me :( I love you.",
      padding: context.padding8,
    );
  }

  Widget buildMiddleTextWithBorder() {
    return InformerWidget(onPageBuild: (context, info) {
      return Padding(
        padding: EdgeInsets.all(context.padding2),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(context.padding4),
          decoration: buildBoxDecoration(info),
          child: CustomAutoSizeText(
            text:
                "You've already found something to enjoy. I appreciate you. So, there is no need to use this application anymore. See you when you are bored buddy!",
            maxLines: null,
            padding: context.padding8,
          ),
        ),
      );
    });
  }

  BoxDecoration buildBoxDecoration(ScreenInformation info) {
    return BoxDecoration(
        border: Border.all(width: 2, color: context.secondaryColor),
        borderRadius: BorderRadius.circular(12));
  }
}
