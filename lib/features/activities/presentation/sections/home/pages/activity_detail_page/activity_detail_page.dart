import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:im_bored_app/core/constants/custom_colors.dart';
import 'package:im_bored_app/core/navigation/routes/navigation_routes.dart';
import 'package:im_bored_app/core/navigation/services/navigation_service.dart';
import 'package:im_bored_app/features/activities/domain/entities/activity_entity.dart';
import 'package:im_bored_app/features/activities/presentation/components/custom_app_bar.dart';
import 'package:im_bored_app/features/activities/presentation/components/loading_indicator.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/pages/activity_detail_page/components/activity_failure.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/pages/activity_detail_page/components/activity_initial.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/pages/activity_detail_page/components/activity_loaded.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/pages/choose_type_page/choose_type_page.dart';
import 'package:im_bored_app/features/activities/presentation/sections/home/viewmodel/home_view_model.dart';
import 'package:im_bored_app/features/activities/starting_files/get_it_injection_container.dart';
import '../../../../components/custom_bold_text_button.dart';
import '../../../../components/custom_text_button.dart';
import '../../../../../../../core/user_interface/extensions/context_extension.dart';

import 'components/activity_info_texts.dart';
import 'components/custom_text_button_between_lines.dart';

class ActivityDetailPage extends StatefulWidget {
  ActivityDetailPage({Key? key}) : super(key: key);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
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
        child: Container(
          padding: EdgeInsets.all(context.padding6),
          child: Column(
            children: [
              Expanded(
                flex: 88,
                child: buildTopScreen(),
              ),
              Spacer(
                flex: 12,
              ),
              Expanded(
                flex: 24,
                child: buildButtons(context),
              ),
              Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 9,
                child: buildCurrentTypeButton(),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopScreen() {
    return Observer(
      builder: (_) {
        return _homeViewModel.activityStateResult.when(initial: () {
          return ActivityInitial();
        }, loading: () {
          return LoadingIndicator();
        }, failed: (failure) {
          return ActivityFailure(failureMessage: failure.message);
        }, completed: (result) {
          return ActivityLoaded(entity: result);
        });
      },
    );
  }

  Widget buildCurrentTypeButton() {
    return Observer(builder: (_) {
      return CustomTextButtonBetweenLines(
        text: "current type: ${_homeViewModel.selectedActivityType}",
        onPressed: () {
          NavigationService().navigateTo(
            NavigationRoute.chooseTypePage(ChooseTypePage()),
          );
        },
      );
    });
  }

  Column buildButtons(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: buildBoldTextButton(),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 7,
          child: buildCustomTextButton(),
        )
      ],
    );
  }

  CustomBoldTextButton buildBoldTextButton() {
    return CustomBoldTextButton(
      text: "Give me another one",
      onPressed: () {
        _homeViewModel.getRandomActivity();
      },
    );
  }

  Widget buildCustomTextButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding12),
      child: CustomTextButton(
          text: "Give me another one with a spesific type",
          maxLine: 2,
          textAlign: TextAlign.center,
          onPressed: () {
            _homeViewModel.getActivityByType();
          }),
    );
  }
}
