import 'package:flutter/material.dart';

showloadingdialog(BuildContext context) {
  showAboutDialog(
    context: context,
    children: [Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 120, width: 120,
          child: const CircularProgressIndicator(),
        ),
      )],
    // builder: (context) {
    //   return Dialog(
    //     child: Container(
    //       padding: const EdgeInsets.all(20),
    //       height: 120, width: 120,
    //       child: const CircularProgressIndicator(),
    //     ),
    //   );
    // },
  );
}


// FutureProgressDialog(Future(() async {
//                                 await saveSale(sale: sale, prints: true);
//                               }));
//                             },
//                           ).then((value) {
//                             widget.newKey.currentState?.closeEndDrawer();
//                             EasyLoading.showSuccess('Sale added');
//                           });




// 
// 
//  onPressed: () async {
//                         if (sale.credit == null || sale.credit == 0.0) {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return FutureProgressDialog(Future(() async {
//                                 await saveSale(sale: sale, prints: false);
//                               }));
//                             },
//                           ).then((value) {
//                             widget.newKey.currentState?.closeEndDrawer();
//                             EasyLoading.showSuccess('Sale added');
//                           });
//                         } else {
//                           if (sale.customerId == null) {
//                             EasyLoading.showToast('Add Customer');
//                           } else {
//                             showDialog(
//                               context: context,
//                               builder: (context) {
//                                 return FutureProgressDialog(Future(() async {
//                                   await saveSale(sale: sale, prints: false);
//                                 }));
//                               },
//                             ).then((value) {
//                               widget.newKey.currentState?.closeEndDrawer();
//                               EasyLoading.showSuccess('Sale added');
//                             });
//                           }
//                         }
//                       }