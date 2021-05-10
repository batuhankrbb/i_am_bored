import 'package:flutter/material.dart';

import '../../../../../../../core/user_interface/extensions/context_extension.dart';
import '../../../../../starting_files/get_it_injection_container.dart';
import '../../../../components/custom_app_bar.dart';
import '../../../../components/custom_big_text.dart';
import '../../viewmodel/home_view_model.dart';
import 'components/text_list_wheel_view.dart';

class ChooseTypePage extends StatefulWidget {
  ChooseTypePage({Key? key}) : super(key: key);

  @override
  _ChooseTypePageState createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = getit.get<HomeViewModel>();
    _homeViewModel.setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 7,
            ),
            Expanded(
              flex: 10,
              child: buildBigText(context),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 60,
              child: buildTextListWheelView(),
            ),
            Spacer(
              flex: 18,
            ),
          ],
        ),
      ),
    );
  }

  TextListWheelView buildTextListWheelView() {
    return TextListWheelView(
      textList: _homeViewModel.allActivities,
      onSelectedItemChanged: _homeViewModel.changeCurrentActivityType,
    );
  }

  Container buildBigText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.padding8),
      alignment: Alignment.center,
      child: CustomBigText(
        texts: ["current type is"],
        alignment: Alignment.center,
      ),
    );
  }
}
