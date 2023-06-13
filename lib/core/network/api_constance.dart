import 'endpoint.dart';

class ApiConstance {
  static const String baseUrl = "http://52.91.25.191:85/api";


  static  String login(String numberPhone) =>
      "$baseUrl/$LOGIN?dialCode=%2B963&phoneNumber=$numberPhone";
}