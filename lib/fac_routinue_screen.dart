import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_campus/presentation/ui/utility/app_colors.dart';

class FacRoutinueScreen extends StatefulWidget {
  FacRoutinueScreen({super.key, required this.shortWords});

  final String shortWords;

  @override
  State<FacRoutinueScreen> createState() => _FacRoutinueScreenState();
}

class _FacRoutinueScreenState extends State<FacRoutinueScreen> {
  List ok1 = [];
  List ok2 = [];
  List ok3 = [];
  List ok4 = [];
  List ok5 = [];
  List ok6 = [];
  List ok7 = [];

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

  late List one;
  late List one2;
  late List one3;
  late List one4;
  late List one5;
  late List one6;
  late List one7;
  late List one8;
  late List one9;
  late List one10;
  late List one11;

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
    _loadData();
  }

  Future<void> _loadData() async {
    String nameShortForm = widget.shortWords;

    final result1 = await loadCsvData1(nameShortForm);
    final result2 = await loadCsvData2(nameShortForm);
    final result3 = await loadCsvData3(nameShortForm);
    final result4 = await loadCsvData4(nameShortForm);
    final result5 = await loadCsvData5(nameShortForm);
    final result6 = await loadCsvData6(nameShortForm);
    final result7 = await loadCsvData7(nameShortForm);

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

    List<List<Map<String, String>>> csvLists = [
      csvData1,
      csvData2,
      csvData3,
      csvData4,
      csvData5,
      csvData6,
      csvData7
    ];

    // List<List> okLists = [ok1, ok2, ok3, ok4, ok5, ok6, ok7];
    //
    // for (var i = 0; i < csvLists.length; i++) {
    //   for (var j = 0; j < csvLists[i].length; j++) {
    //     okLists[i].add(csvLists[i][j]['TimeSlots']
    //         .toString()
    //         .split(' ')
    //         .where((slot) => slot != 'N/A' && slot.isNotEmpty)
    //         .join(' '));
    //   }
    // }
    // print(ok1);
    // print(ok2);
    // print(ok3);
    // print(ok4);
    // print(ok5);
    // print(ok6);
    // print(ok7);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Routine'),
            backgroundColor: AppColors.primaryColor,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      'Saturday (Total Class: ${one.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                one.isEmpty ? 1 : one.length, (colIndex) {
                              if (colIndex < one.length) {
                                final timeSlots = one[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
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
                            children: List.generate(
                                one.isEmpty ? 1 : one.length, (colIndex) {
                              if (colIndex < one.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${one[colIndex]['Batch'].toString()} (${one[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: .1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sunday (Total Class: ${two.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                two.isEmpty ? 1 : two.length, (colIndex) {
                              if (colIndex < two.length) {
                                final timeSlots = two[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(
                                two.isEmpty ? 1 : two.length, (colIndex) {
                              if (colIndex < two.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${two[colIndex]['Batch'].toString()} (${two[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Monday (Total Class: ${three.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                three.isEmpty ? 1 : three.length, (colIndex) {
                              if (colIndex < three.length) {
                                final timeSlots = three[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(
                                three.isEmpty ? 1 : three.length, (colIndex) {
                              if (colIndex < three.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${three[colIndex]['Batch'].toString()} (${three[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tuesday (Total Class: ${four.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                four.isEmpty ? 1 : four.length, (colIndex) {
                              if (colIndex < four.length) {
                                final timeSlots = four[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(four.length, (colIndex) {
                              if (colIndex < four.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${four[colIndex]['Batch'].toString()} (${four[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Wednesday (Total Class: ${five.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                five.isEmpty ? 1 : five.length, (colIndex) {
                              if (colIndex < five.length) {
                                final timeSlots = five[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(
                                five.isEmpty ? 1 : five.length, (colIndex) {
                              if (colIndex < five.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${five[colIndex]['Batch'].toString()} (${five[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Thursday (Total Class: ${six.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                six.isEmpty ? 1 : six.length, (colIndex) {
                              if (colIndex < six.length) {
                                final timeSlots = six[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(
                                six.isEmpty ? 1 : six.length, (colIndex) {
                              if (colIndex < six.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${six[colIndex]['Batch'].toString()} (${six[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Friday (Total Class: ${seven.length})',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Table(
                        border:
                            TableBorder.all(borderRadius: BorderRadius.zero),
                        children: [
                          TableRow(
                            children: List.generate(
                                seven.isEmpty ? 1 : seven.length, (colIndex) {
                              if (colIndex < seven.length) {
                                final timeSlots = seven[colIndex]['TimeSlots']
                                    .toString()
                                    .split(' ')
                                    .where((slot) =>
                                        slot != 'N/A' && slot.isNotEmpty)
                                    .toList();

                                String displayText;
                                if (timeSlots.length == 1) {
                                  displayText = timeSlots.first;
                                } else if (timeSlots.length == 2) {
                                  displayText =
                                      '${timeSlots.first}\n${timeSlots.last}';
                                } else {
                                  displayText = '';
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      displayText,
                                      style: TextStyle(
                                          overflow: TextOverflow.visible,
                                          fontSize: 11.20.sp,
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
                            children: List.generate(
                                seven.isEmpty ? 1 : seven.length, (colIndex) {
                              if (colIndex < seven.length) {
                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Text(
                                      '${seven[colIndex]['Batch'].toString()} (${seven[colIndex]['Section'].toString()})',
                                      style: TextStyle(
                                        overflow: TextOverflow.visible,
                                        fontSize: 12.23.sp,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                );
                              }
                            }),
                          ),
                        ]),
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

  Future<List<Map<String, String>>> loadCsvData1(String shortForm) async {
    final csvString =
        await rootBundle.loadString('assets/routinue/saturday.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData2(String shortForm) async {
    final csvString = await rootBundle.loadString('assets/routinue/sunday.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData3(String shortForm) async {
    final csvString = await rootBundle.loadString('assets/routinue/monday.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData4(String shortForm) async {
    final csvString =
        await rootBundle.loadString('assets/routinue/tuesdayy.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData5(String shortForm) async {
    final csvString =
        await rootBundle.loadString('assets/routinue/wednesdayy.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData6(String shortForm) async {
    final csvString =
        await rootBundle.loadString('assets/routinue/thursdayy.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }

  Future<List<Map<String, String>>> loadCsvData7(String shortForm) async {
    final csvString = await rootBundle.loadString('assets/routinue/friday.csv');
    final csvData = const CsvToListConverter().convert(csvString, eol: '\n');

    if (csvData.isEmpty) return [];

    final headerRow = csvData[1].map((e) => e.toString()).toList();
    final dataRows = csvData.skip(2).toList();

    final filteredRows = dataRows.where((row) {
      return row.any((cell) => cell.toString().contains(shortForm));
    }).toList();

    final result = filteredRows.map((row) {
      final rowMap = <String, String>{
        'Batch': row[1].toString(),
        'Section': row[2].toString(),
        'TimeSlots': headerRow.asMap().entries.map((entry) {
          return row[entry.key].toString().contains(shortForm)
              ? headerRow[entry.key]
              : 'N/A';
        }).join(' ')
      };
      return rowMap;
    }).toList();

    return result;
  }
}
