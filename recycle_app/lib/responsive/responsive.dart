import 'package:flutter/material.dart';
import 'package:recycle_app/responsive/sizeinformation.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizeInformation constraints)
      builder;
  // final AppBar appBar;
  final BottomNavigationBar bottomNavigationBar;
  final FloatingActionButton floatingActionButton;
  const ResponsiveWidget(
      {Key? key,
      required this.builder,
      // required this.appBar,
      required this.floatingActionButton,
      required this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInformation information = SizeInformation(width, height, orientation);

    return SafeArea(
        child: Scaffold(
            primary: true,
            // appBar: appBar,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
            resizeToAvoidBottomInset: false,
            body: Builder(builder: (context) {
              return builder(context, information);
            })));
  }
}
