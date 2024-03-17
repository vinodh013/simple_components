// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:wholesale_pos_online/surreal.dart';

// createfunction(WidgetRef ref) async {
//   var c = ref.read(surrealProvider);

//   var a = await c.query(query);

//   print(a);
// }

// var query = '''
// define function fn::addquantity(\$products : Array, \$warehouseId : record ) {

//       FOR \$p IN \$products {
//         LET \$w  = \$warehouseId;
//         IF \$p.varientProducts != null THEN {
            
//             FOR \$v IN \$p.varientProducts  {

//                LET \$d = select quantity[where warehouseId = \$w] from \$v.productId;

//                IF \$d[0].quantity == [] THEN {

//                    update \$v.productId set quantity += {quantity : \$v.qty, warehouseId : \$w};

//                } ELSE {

//                    update \$v.productId set quantity[where warehouseId == \$w][0].quantity += \$v.qty;

//                } END

              

//             };
//         } ELSE {

//             LET \$a = select quantity[where warehouseId = \$w] from \$p.productId;

//             IF \$a[0].quantity == [] THEN {
//                    update \$p.productId set quantity += {quantity : \$p.qty, warehouseId : \$w };
                   
//            } ELSE {

//               update \$p.productId set quantity[where warehouseId = \$w][0].quantity += \$p.qty;

//            }  END ;

 
//         } END

//     };
    
//     return true;

     
// };

// ''';
