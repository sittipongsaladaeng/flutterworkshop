import 'package:flutter/material.dart';
import 'package:flutter_workshop_api/controller/notification/notification_controller.dart';
import 'package:flutter_workshop_api/model/notification/notification_model.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var _controller = NotificationController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: _controller.requestNotificationData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return _buildNotificationList(snapshot.data);
            } else {
              return _buildProgressLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildProgressLoading() {
    return Container(
      color: Colors.white,
      height: 100.0,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNotificationList(NotificationModel noti) {
    return ListView.builder(
      itemCount: noti.data.messageList.length,
      itemBuilder: (context, index) {
        return Text(noti.data.messageList[index].subject);
      },
    );
  }
}
