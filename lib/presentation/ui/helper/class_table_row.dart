import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Table buildClassTable(dynamic dayNumberRow, dynamic shortWords) {
  return Table(
      border: TableBorder.all(borderRadius: BorderRadius.zero),
      children: [
        TableRow(
          children: List.generate(dayNumberRow.isEmpty ? 1 : dayNumberRow.length, (colIndex) {
            if (colIndex < dayNumberRow.length) {
              final timeSlots = dayNumberRow[colIndex]['TimeSlots']
                  .toString()
                  .split(' ')
                  .where((slot) => slot != 'N/A' && slot.isNotEmpty)
                  .toList();

              String displayText;
              if (timeSlots.length == 1) {
                displayText = timeSlots.first;
              } else if (timeSlots.length == 2) {
                displayText = '${timeSlots.first}\n${timeSlots.last}';
              } else {
                displayText = timeSlots.join('\n');
              }
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    displayText,
                    style: TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 12.23.sp,
                        fontWeight: FontWeight.w600,
                        //letterSpacing: 1,
                        color: Colors.redAccent),
                  ),
                ),
              );
            } else {
              return const SizedBox(
                height: 0,
              );
            }
          }),
        ),
        TableRow(
          children: List.generate(dayNumberRow.isEmpty ? 1 : dayNumberRow.length, (colIndex) {
            if (colIndex < dayNumberRow.length) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${dayNumberRow[colIndex]['Batch'].toString()} (${dayNumberRow[colIndex]['Section'].toString()})',
                        style: TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 13.23.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        dayNumberRow[colIndex]['Details']
                            .toString()
                            .split(shortWords)
                            .toSet()
                            .join(''),
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 12.23.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox(
                height: 30,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                        'Off Day',
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      )),
                ),
              );
            }
          }),
        ),
      ]);
}