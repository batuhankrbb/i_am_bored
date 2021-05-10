import 'package:flutter/material.dart';

import '../../../../../../../../core/user_interface/responsive_layout/widgets/informer_widget.dart';
import '../../../../../../starting_files/get_it_injection_container.dart';
import '../../../viewmodel/home_view_model.dart';
import 'bounded_auto_size_text.dart';

class TextListWheelView extends StatefulWidget {
  TextListWheelView(
      {Key? key, required this.textList, required this.onSelectedItemChanged})
      : super(key: key);

  final List<String> textList;
  final void Function(int) onSelectedItemChanged;

  @override
  _TextListWheelViewState createState() => _TextListWheelViewState();
}

class _TextListWheelViewState extends State<TextListWheelView> {
  late FixedExtentScrollController _controller;
  late HomeViewModel _homeViewmodel;

  @override
  void initState() {
    super.initState();
    _homeViewmodel = getit.get<HomeViewModel>();
    _controller = FixedExtentScrollController(
      initialItem:
          _homeViewmodel.allActivities.indexOf(_homeViewmodel.selectedActivityType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InformerWidget(
      onPageBuild: (context, expandedInfo) {
        return ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: expandedInfo.boundsSize.height * 0.17,
          magnification: 1.3,
          useMagnifier: true,
          physics: FixedExtentScrollPhysics(),
          childDelegate: buildListWheelChildBuilderDelegate(),
          onSelectedItemChanged: widget.onSelectedItemChanged,
        );
      },
    );
  }

  ListWheelChildBuilderDelegate buildListWheelChildBuilderDelegate() {
    return ListWheelChildBuilderDelegate(
      childCount: widget.textList.length,
      builder: (context, index) {
        return BoundedAutoSizeText(
          text: widget.textList[index],
        );
      },
    );
  }
}
