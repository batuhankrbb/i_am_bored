import 'package:flutter/material.dart';

import '../user_interface/extensions/context_extension.dart';
import '../user_interface/responsive_layout/widgets/informer_widget.dart';

class BoldButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  const BoldButton({Key? key, required this.onPressed, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, information) {
        return ElevatedButton(
          //Elevated ile değiştir
          style: ElevatedButton.styleFrom(
            primary: context.secondaryColor,
            padding: EdgeInsets.all(context.padding8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: child,
        );
      },
    );
  }
}
