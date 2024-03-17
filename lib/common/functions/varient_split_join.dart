//
// List<List<String>> generateCombinations(List<List<String>> lists) {
//   List<List<String>> result = [];
//   int numberOfLists = lists.length;
//   List<int> indices = List.filled(numberOfLists, 0);
//
//   while (true) {
//     List<String> combination =
//         List.generate(numberOfLists, (index) => lists[index][indices[index]]);
//     result.add(combination);
//
//     int i = numberOfLists - 1;
//     while (i >= 0 && indices[i] == lists[i].length - 1) {
//       indices[i] = 0;
//       i--;
//     }
//
//     if (i < 0) {
//       break;
//     }
//
//     indices[i]++;
//   }
//   return result;
// }

// List<Map<String, String>> generateVarientCombinations(List<Varient> variants) {
//   // print(variants);
//   List<Map<String, String>> result = [];

//   void generate(int index, Map<String, String> current) {
//     if (index == variants.length) {
//       result.add(Map.from(current));
//       return;
//     }

//     if (variants[index].values != null && variants[index].values!.isNotEmpty) {
//       for (String value in variants[index].values!) {
//         current[variants[index].name ?? ''] = value;
//         generate(index + 1, current);
//         current.remove(variants[index].name);
//       }
//     } else {
//       // Handle the case when a variant has only one value or is empty
//       current[variants[index].name ?? ''] = "";
//       generate(index + 1, current);
//       current.remove(variants[index].name);
//     }
//   }

//   generate(0, {});

//   result = result
//       .where((combination) =>
//           combination.keys.length == variants.length &&
//           combination.keys.every((key) =>
//               combination[key] != null && combination[key]!.isNotEmpty))
//       .toList();

//   print(result);

//   return result;
// }
