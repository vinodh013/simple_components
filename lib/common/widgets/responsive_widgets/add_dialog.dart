import 'package:flutter/material.dart';

Future showdialogOrmodelbottomsheet(
    {required BuildContext context,
    required Widget newwidget,
    double? height,
    double? width}) {
  return MediaQuery.of(context).size.width > 600
      ? showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              alignment: Alignment.topCenter,
              insetPadding: const EdgeInsets.all(10),
              child: Container(
                  margin: const EdgeInsets.all(10),
                  width: width ?? 600,
                  height: height,
                  child: newwidget),
            );
          },
        )
      : showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Column(
              children: [
                Expanded(child: newwidget),
              ],
            );
          });
}



// savevalue({
//   required Future future,
// }) {
//   FutureProgressDialog(Future(() {
      
//   }).then((value) {
     
//   }));
// }

// FutureProgressDialog(Future(() async {
//                                 await saveSale(sale: sale, prints: true);
//                               }));
//                             },
//                           ).then((value) {
//                             widget.newKey.currentState?.closeEndDrawer();
//                             EasyLoading.showSuccess('Sale added');
//                           });
