import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class customProgressHud extends StatelessWidget {
  const customProgressHud(
      {super.key, required this.isloading, required this.child});
  final bool isloading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: isloading, child: child);
  }
}
