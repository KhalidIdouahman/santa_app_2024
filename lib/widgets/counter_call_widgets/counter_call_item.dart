import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/schedule_call.dart';
  
// this function returns the design of the item in counter page.

// i need to search on this to understand it will .
typedef CallbackAction = void Function();

Widget buildListCounterCallItem({
    required ScheduleCallObj scheduleCall,
    required Map<int , int> storedTimes,
    required CallbackAction onItemClicked,
  }) {

    // i get the index of the clicked item to change the icons depends on the value of it ,
    final callIndex = scheduleCalls.indexOf(scheduleCall);
    final remainingTime =
        storedTimes[callIndex] ?? scheduleCall.duration;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: InkWell(
          onTap: onItemClicked,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                storedTimes[callIndex] == null
                    ? Icon(
                        scheduleCall.prefixIcon,
                        color: Colors.black,
                        size: 22,
                      )
                    : Text(
                        remainingTime.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                Row(
                  children: [
                    Text(
                      scheduleCall.duration.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      scheduleCall.unit,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                storedTimes[callIndex] == null
                    ? const Icon(
                        Icons.call,
                        color: Colors.black,
                        size: 22,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 22,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }