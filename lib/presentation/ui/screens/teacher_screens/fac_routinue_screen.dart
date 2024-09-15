import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/helper/class_table_row.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';

class FacRoutineScreen extends StatefulWidget {
  const FacRoutineScreen({super.key, required this.shortWords});

  final String shortWords;

  @override
  State<FacRoutineScreen> createState() => _FacRoutineScreenState();
}

class _FacRoutineScreenState extends State<FacRoutineScreen> {
  dynamic batch1;
  dynamic section1;
  dynamic timeSlots1;

  dynamic batch2;
  dynamic section2;
  dynamic timeSlots2;

  dynamic batch3;
  dynamic section3;
  dynamic timeSlots3;

  dynamic batch4;
  dynamic section4;
  dynamic timeSlots4;

  dynamic batch5;
  dynamic section5;
  dynamic timeSlots5;

  dynamic batch6;
  dynamic section6;
  dynamic timeSlots6;

  dynamic batch7;
  dynamic section7;
  dynamic timeSlots7;

  dynamic one;
  dynamic one2;
  dynamic one3;
  dynamic one4;
  dynamic one5;
  dynamic one6;
  dynamic one7;
  dynamic one8;
  dynamic one9;
  dynamic one10;
  dynamic one11;

  dynamic two;
  dynamic two2;
  dynamic two3;
  dynamic two4;
  dynamic two5;
  dynamic two6;
  dynamic two7;
  dynamic two8;
  dynamic two9;
  dynamic two10;
  dynamic two11;

  dynamic three;
  dynamic three2;
  dynamic three3;
  dynamic three4;
  dynamic three5;
  dynamic three6;
  dynamic three7;
  dynamic three8;
  dynamic three9;
  dynamic three10;
  dynamic three11;

  dynamic four;
  dynamic four2;
  dynamic four3;
  dynamic four4;
  dynamic four5;
  dynamic four6;
  dynamic four7;
  dynamic four8;
  dynamic four9;
  dynamic four10;
  dynamic four11;

  dynamic five;
  dynamic five2;
  dynamic five3;
  dynamic five4;
  dynamic five5;
  dynamic five6;
  dynamic five7;
  dynamic five8;
  dynamic five9;
  dynamic five10;
  dynamic five11;

  dynamic six;
  dynamic six2;
  dynamic six3;
  dynamic six4;
  dynamic six5;
  dynamic six6;
  dynamic six7;
  dynamic six8;
  dynamic six9;
  dynamic six10;
  dynamic six11;

  dynamic seven;
  dynamic seven2;
  dynamic seven3;
  dynamic seven4;
  dynamic seven5;
  dynamic seven6;
  dynamic seven7;
  dynamic seven8;
  dynamic seven9;
  dynamic seven10;
  dynamic seven11;

  dynamic eight;
  dynamic eight2;
  dynamic eight3;
  dynamic eight4;
  dynamic eight5;
  dynamic eight6;
  dynamic eight7;
  dynamic eight8;
  dynamic eight9;
  dynamic eight10;
  dynamic eight11;

  List<Map<String, String>> csvData1 = [];
  List<Map<String, String>> csvData2 = [];
  List<Map<String, String>> csvData3 = [];
  List<Map<String, String>> csvData4 = [];
  List<Map<String, String>> csvData5 = [];
  List<Map<String, String>> csvData6 = [];
  List<Map<String, String>> csvData7 = [];
  List times = [
    '08:55-9:45AM',
    '9:50-10:40AM',
    '10:45-11:35AM',
    '11:40-12:30PM',
    '12:35-1:25PM',
    '1:30-2:10PM',
    '2:15-3:05PM',
    '3:10-4:00PM',
    '4:05-4:55PM'
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5)).then((value) {
      _loadData();
    });
  }

  final TextEditingController _controller = TextEditingController();

  Future<void> _loadData() async {
    String nameShortForm = widget.shortWords;

    final result1 = await loadCsvData('saturday', nameShortForm);
    final result2 = await loadCsvData('sunday', nameShortForm);
    final result3 = await loadCsvData('monday', nameShortForm);
    final result4 = await loadCsvData('tuesday', nameShortForm);
    final result5 = await loadCsvData('wednesday', nameShortForm);
    final result6 = await loadCsvData('thursday', nameShortForm);
    final result7 = await loadCsvData('friday', nameShortForm);

    setState(() {
      csvData1 = List<Map<String, String>>.from(result1);
      csvData2 = List<Map<String, String>>.from(result2);
      csvData3 = List<Map<String, String>>.from(result3);
      csvData4 = List<Map<String, String>>.from(result4);
      csvData5 = List<Map<String, String>>.from(result5);
      csvData6 = List<Map<String, String>>.from(result6);
      csvData7 = List<Map<String, String>>.from(result7);
    });

    one = csvData1;
    two = csvData2;
    three = csvData3;
    four = csvData4;
    five = csvData5;
    six = csvData6;
    seven = csvData7;

    final times = [
      '08:55-9:45AM',
      '9:50-10:40AM',
      '10:45-11:35AM',
      '11:40-12:30PM',
      '12:35-1:25PM',
      '1:30-2:10PM',
      '2:15-3:05PM',
      '3:10-4:00PM',
      '4:05-4:55PM'
    ];

    // Create a map for time slot indices
    final timeIndices = {for (var v in times) v: times.indexOf(v)};

    // Function to get the index for a time slot
    int getTimeSlotIndex(String timeSlot) {
      return timeIndices[timeSlot] ?? -1;
    }

    // Function to sort 'four' based on the 'times' list and move 'OL Class' to the end
    void sortByTimes(List<Map<String, dynamic>> dataList) {
      dataList.sort((a, b) {
        final timeSlotA = a['TimeSlots'] as String;
        final timeSlotB = b['TimeSlots'] as String;

        final isOLClassA = timeSlotA.contains('OL Class');
        final isOLClassB = timeSlotB.contains('OL Class');

        if (isOLClassA && !isOLClassB) {
          return 1; // Move OL Class entries to the end
        } else if (!isOLClassA && isOLClassB) {
          return -1; // Keep non-OL Class entries before OL Class entries
        } else {
          // For entries that are either both OL Class or both not OL Class, sort by time slot
          final firstSlotA = timeSlotA.split(' ').first;
          final firstSlotB = timeSlotB.split(' ').first;
          return getTimeSlotIndex(firstSlotA)
              .compareTo(getTimeSlotIndex(firstSlotB));
        }
      });
    }

    sortByTimes(one);
    sortByTimes(two);
    sortByTimes(three);
    sortByTimes(four);
    sortByTimes(five);
    sortByTimes(six);
    sortByTimes(seven);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: buildAppBar(context),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    buildDayUi('Saturday',one),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(one, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Sunday',two),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(two, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Monday',three),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(three, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Tuesday',four),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(four, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Wednesday',five),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(five, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Thursday',six),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(six, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                    buildDayUi('Friday',seven),
                    const SizedBox(
                      height: 4,
                    ),
                    buildClassTable(seven, widget.shortWords),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
          title: const Text('Routine'),
          backgroundColor: AppColors.primaryColor,
          actions: [_buildSearchOtherFacultyRoutine(context)],
        );
  }

  Text buildDayUi(String dayName, dynamic dayNumber) {
    return Text(
      '$dayName (Total Class: ${dayNumber.length})',
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),
    );
  }

  IconButton _buildSearchOtherFacultyRoutine(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Class Time",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w900),
              ),
              content: Text("See Other Faculty Routine",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
              actions: [
                TextFormField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(hintText: 'Short Form of Faculty'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => FacRoutineScreen(
                                    shortWords: _controller.text)));
                      },
                      child: Text(
                        "Go",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        Icons.find_in_page,
        size: 30.h,
      ),
    );
  }

  Future<List<Map<String, String>>> loadCsvData(
    String day,
    String shortForm,
  ) async {
    final csvString = await rootBundle.loadString('assets/routine/$day.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow =
        csvData[1].map((e) => e.toString()).toList(); // Header row
    final dataRows = csvData
        .skip(2)
        .toList(); // Data rows, skipping the first two non-data rows

    // Filter rows containing the shortForm
    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final timeSlots = headerRow
          .asMap()
          .entries
          .where((entry) {
            return row[entry.key].toString().contains(shortForm);
          })
          .map((entry) => headerRow[entry.key])
          .toList();

      // Creating a map to store relevant information
      final rowMap = <String, String>{
        'Batch': row[1].toString(), // Adjust the index if needed
        'Section': row[2].toString(), // Adjust the index if needed
        'TimeSlots': timeSlots.join(' '),
        'Details': row
            .where((cell) => cell.toString().contains(shortForm))
            .map((cell) => cell.toString())
            .join(', '),
      };

      return rowMap;
    }).toList();

    result.sort((a, b) {
      final timeSlotsA = a['TimeSlots'] ?? '';
      final timeSlotsB = b['TimeSlots'] ?? '';
      return timeSlotsA.compareTo(timeSlotsB);
    });

    return result;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
  }
}
