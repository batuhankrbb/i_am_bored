import 'package:flutter/material.dart';
import 'package:im_bored_app/core/user_interface/extensions/context_extension.dart';
import 'package:im_bored_app/core/user_interface/responsive_layout/widgets/informer_widget.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(onPageBuild: (context, info) {
      return Center(
        child: Container(
          height: info.boundsSize.width * 0.2,
          width: info.boundsSize.width * 0.2,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(context.secondaryColor),
          ),
        ),
      );
    });
  }
}
