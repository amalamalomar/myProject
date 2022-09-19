import 'package:http/http.dart' as http;
import '../../../configuration/api.dart';
import 'dart:convert';
import '../../../configuration/secure_storage.dart';

class AddActivityServices {
  var token;
  late SecureStorage secureStorage = SecureStorage();
  Future<bool> addActivity(
      String title, String cost, String description) async {
    var url = Uri.parse(baseUrl + addActivityRoute);
    token = await secureStorage.readToken('token');

    var response = await http.post(url, headers: {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzNhYzllZDRiM2NjMmYxNTUxODk4MzAyNzk4YzVhYTc0MmY1M2NmNGQ0MDUyZmUzODJlY2NjNWQ1ZTRmNDM4MDdjZjE2NzRkYTc3OTE0YTQiLCJpYXQiOjE2NjE1MDMwNTUuMjQ2MTU0LCJuYmYiOjE2NjE1MDMwNTUuMjQ2MTYyLCJleHAiOjE2OTMwMzkwNTUuMDQ1MDMyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.zypxscmDS5m82hRl4_6brCnjn9FC8OjVCoFSDswjdD1IK4rZpjh1f4OufMtuJvwEJVpR1_al59uze-Qd8qRxSs5OgsTxwG2CRAPeO9D0zo3DXdzFtA5nPrmpIH2QhfFcy2ZpnluEE5OVHHh3iMZav9pciqh-msEO8AegqEugEXe4zL5gQ9NpxZ4Vm_lP4DPKcjqdNELC7osPCN9ZdZeyTWwmTZwf_WeEMH3b1t1Kb6atj3a7m6ejFOQ_-HMnCW1_Eczjc4moDZOQrE4BozjyZjs9HG-5YjlDKcugzkGRE6pTHZ5cvKac_83ibxQw6Diqrjlkso7aL0a4qQqKJWjznsygFzYIEjJsKq6JQoUg0ynAy49vqRZe0Zp45jBl6MUIEqUY6GEMLr6s9fGhcsfSZIhqgMcaGTGkw5FBqR_dtenJFRJ_8NQNpuDnAU9xU5aifZtunQepQbw2Mjw1XH71rQBa9fwsakeHdJxmnE0Hg00BkGf1WVYHXNQx6sNIclCe81iQUzYMEkWqn_W4udih7KbRF0e28p6ytIqT3cXbGmMqIFYJiAJ2KfjiL0M1R-BFMOM38u5rzL0Wd87t9eXBcJ78amOvvvU_YU_t0bIhKZNyh73OPOwAjrOKjoYu6yGwRi48SeBSQryZQOLaHKMRHSkPQmRze3dW4GdwMIb6lxI' // 'Bearer $token'
    }, body: {
      'title': title,
      'cost': cost,
      'description': description,
      'charity_id': '1',
      'completed': '1',
    });
    //  Map<String, dynamic> map = jsonDecode(response.body);
    if (response.statusCode == 201) {
      print('tttttruuuuuuuuuu------------------------------------------------');

      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}
