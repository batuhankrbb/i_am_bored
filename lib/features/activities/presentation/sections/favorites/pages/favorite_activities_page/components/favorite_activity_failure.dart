import 'package:flutter/material.dart';

import '../../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../../starting_files/get_it_injection_container.dart';
import '../../../../../components/custom_bold_text_button.dart';
import '../../../../../components/custom_text.dart';
import '../../../viewmodel/favorites_viewmodel.dart';

class FavoriteActivityFailure extends StatelessWidget {
  FavoriteActivityFailure({Key? key, required this.failureMessage})
      : super(key: key);

  final String failureMessage;
  var _favoriteViewModel = getit.get<FavoritesViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.padding6),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 50,
            child: buildFailureMessage(context),
          ),
          Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 10,
            child: buildDownToRefreshText(context),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  CustomAutoSizeText buildFailureMessage(BuildContext context) {
    return CustomAutoSizeText(
      text: failureMessage,
      textAlign: TextAlign.center,
      maxLines: 4,
      fontSize: 100,
      color: context.errorColor,
    );
  }

  Padding buildDownToRefreshText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.padding6),
      child: CustomBoldTextButton(
        text: "click to refresh",
        onPressed: () {
          _favoriteViewModel.getAllFavorites();
        },
      ),
    );
  }
}
