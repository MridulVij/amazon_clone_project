import 'dart:convert';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showwSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showwSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showwSnackBar(context, response.body);
  }
}
