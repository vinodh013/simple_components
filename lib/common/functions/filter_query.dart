
String generateQuery(List<String> names, String title, List<String> operator,
    String joinOperator) {
  if (names.isEmpty) {
    // If the list is empty, return an empty string or handle it as needed
    return '';
  }

  // Use the join method to concatenate the conditions using '||' (OR)
  String conditions =
      names.map((name) => '$title $operator "$name"').join(' || ');

  // Construct the final query string
  String query = '($conditions)';
  return query;
}

Map<Map<String, String>, String> c = {
  {"name": "~"}: "vinodh",
  {"name": "~"}: "yogesh",
};

String buildQuery(Map<Map<String, String>, String> input, String joinOperator) {
  List<String> conditions = [];

  input.forEach((condition, value) {
    String fieldName = condition.keys.first;
    String operator = condition.values.first;

    // Construct the condition string
    String conditionString = '$fieldName $operator "$value"';

    conditions.add(conditionString);
  });

  // Join conditions with ' || ' (OR)
  String result = conditions.join(joinOperator);
  return '($result)';
}

// void main() async {

  
//   final client = SurrealDB('ws://wholesale-pos.fly.dev/rpc')..connect();
 
//   await  client.wait();
//   client.use('test', 'test');
//   client.signin(user: 'root', pass: 'root013');
 
//    client;


//   // Map<Map<String, String>, String> c = {
//   //   {"name": "~"}: "vinodh",
//   //   {"name": "~"}: "yogesh",
//   // };

//   // Map<Map<String, String>, String> d = {
//   //   {"date": ">="}: "2023-12-16 20:23:19.190750",
//   //   {"date": "<="}: "2023-12-16 20:23:19.190750",
//   // };

//   // String queryResult = buildQuery(c, " || ");
//   // String dates = buildQuery(d, " && ");
//   // String v = buildQuery({}, " && ");

//   // var l = [queryResult, dates, v];

//   // l.removeWhere((element) => element == "()");
//   // var f = l.join(" && ");

//   // print(v);
//   // print(dates);
//   // print(queryResult);
//   // print(f);
// }




// main() {
//   var d = generateQuery(["vinodh", "yo"], "customer.name", "~");
//   var dates = generateQuery(["12-22023", ">2024"], "dates", "<=");
//   var f = DateTime.now();
//   print(d);
//   print(dates);
// }
