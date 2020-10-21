import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_workshop_api/model/notification/notification_model.dart';

class NotificationController {
  Future<NotificationModel> requestNotificationData() async {
    try {
      Response response = await Dio().get("https://run.mocky.io/v3/17a3dc45-d93e-4949-9e54-be52f58aeca2");
      if (response.statusCode == 200) {
        Map map = jsonDecode(response.toString());
        var model = NotificationModel.fromJson(map);
        return model;
      } else {
        return null; //or create error model for display dialog error.
      }
      print(response);
    } catch (e) {
      print(e);
      return null;
    }
  }
}

// https://run.mocky.io/v3/17a3dc45-d93e-4949-9e54-be52f58aeca2
