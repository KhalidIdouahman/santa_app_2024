import 'dart:async';
import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';
import 'package:santa_app_2024/widgets/counter_call_widgets/counter_call_item.dart';

import 'package:santa_app_2024/functionalities/notifications_handler.dart';

class CounterCallPage extends StatefulWidget {
  const CounterCallPage({super.key});

  @override
  State<CounterCallPage> createState() => _CounterCallPageState();
}

class _CounterCallPageState extends State<CounterCallPage> {

// the instance of the notification handler to work with.
  final NotificationHandler _notificationHandler = NotificationHandler();

  // in this map i store in it the index of the clicked schedule call , and the and the duration that changes each second.
  final Map<int, int> storeCounterDownTimers = {};


  @override
  void initState() {
    super.initState();
    // initialize the notifications
    WidgetsFlutterBinding.ensureInitialized();
    _notificationHandler.initNotifications();
  }

// in this func i take the index of the clicked item to get from it the duration , and starts the timer.
  void startCounter(int callIndex) {
    final scheduleCall = scheduleCalls[callIndex];
    int durationInSeconds = (scheduleCall.unit == 'Seconds')
        ? scheduleCall.duration
        : scheduleCall.duration * 60;

    setState(() {
      storeCounterDownTimers[callIndex] = durationInSeconds;
    });

// in this timer each second checkes if there is a value to be decremented else canceled the timer and go to call page.
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (storeCounterDownTimers[callIndex]! > 0) {
        setState(() {
          storeCounterDownTimers[callIndex] =
              storeCounterDownTimers[callIndex]! - 1;
        });
      } else {
        timer.cancel();
        // when the timer is finished then the notification is pushed.
        _notificationHandler.pushNotification(
          id: 0,
          title: "Santa is Calling",
          descreption: "Hey i'm santa , i want to talk with you good boy.",
          pyload: "call me",
        );
        // pushing to the call page.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MakeCallPage(user: usersList[0]),
          ),
        );
        // this to make the list empty to let the icons of alarm and call to be back .
        setState(() {
          storeCounterDownTimers.remove(callIndex);
        });
      }
    });
  }

// in this i check when some item is clicked if there is no a value in the map to start the timer else to stop it.
  void timerHandler(int index) {
    if (storeCounterDownTimers[index] == null) {
      startCounter(index);
    } else {
      // Cancel countdown
      setState(() {
        storeCounterDownTimers.remove(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Schedule Call",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        // this listview creates the items of the counter page .
        child: ListView.builder(
          itemCount: scheduleCalls.length,
          itemBuilder: (context, index) {
            return buildListCounterCallItem(
              scheduleCall: scheduleCalls[index],
              storedTimes: storeCounterDownTimers,
              onItemClicked: () {
                timerHandler(index);
              },
            );
          },
        ),
      ),
    );
  }
}