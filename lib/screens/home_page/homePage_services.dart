import 'dart:convert';

import 'package:charityapp/controller/modelwaguser1.dart';
import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
//import'dart:convert';
import '../../../configuration/secure_storage.dart';

class HomePageServices {
  var message = '';
  int index = 0;

  Future<List<Datum>> getdatacharity() async {
    var url = Uri.parse(baseUrl + getdatacharityRoute);
    print(url);

    var response = await http.get(
      url,
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var resl = modelcharitiesFromJson(jsonDecode(response.body));

      return resl.data;
    } else {
      return [];
    }
  }
}
