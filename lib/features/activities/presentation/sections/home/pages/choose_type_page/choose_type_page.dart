import 'package:flutter/material.dart';
import '../../../../../utils/activity_types.dart';

import 'components/text_list_wheel_view.dart';



class ChooseTypePage extends StatefulWidget {
  ChooseTypePage({Key? key}) : super(key: key);

  @override
  _ChooseTypePageState createState() => _ChooseTypePageState();
}

class _ChooseTypePageState extends State<ChooseTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(
              flex: 7,
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 60,
              child: TextListWheelView(
                textList: ActivityType.values.map((e) => e.toString()).toList(),
              ),
            ),
            Spacer(
              flex: 18,
            ),
          ],
        ),
      ),
    );
  }
}
