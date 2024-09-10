import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StuClassRoutine extends StatefulWidget {
  const StuClassRoutine({super.key, this.batch, this.section});

  final String? batch;
  final String? section;

  @override
  _StuClassRoutinueState createState() => _StuClassRoutinueState();
}

class _StuClassRoutinueState extends State<StuClassRoutine> {
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  List<dynamic>? jSat = [];
  List<dynamic>? jSun = [];
  List<dynamic>? jMon = [];
  List<dynamic>? jTue = [];
  List<dynamic>? jWed = [];
  List<dynamic>? jThu = [];
  List<dynamic>? jFri = [];

  List<List<dynamic>> _filteredValues = [];
  List<List<dynamic>> _filteredValues2 = [];
  List<List<dynamic>> _filteredValues3 = [];
  List<List<dynamic>> _filteredValues4 = [];
  List<List<dynamic>> _filteredValues5 = [];
  List<List<dynamic>> _filteredValues6 = [];
  List<List<dynamic>> _filteredValues7 = [];

  List<String> days = ['SAT', 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI'];

  String? one;
  String? one2;
  String? one3;
  String? one4;
  String? one5;
  String? one6;
  String? one7;

  String? two;
  String? two2;
  String? two3;
  String? two4;
  String? two5;
  String? two6;
  String? two7;

  String? three;
  String? three2;
  String? three3;
  String? three4;
  String? three5;
  String? three6;
  String? three7;

  String? four;
  String? four2;
  String? four3;
  String? four4;
  String? four5;
  String? four6;
  String? four7;

  String? five;
  String? five2;
  String? five3;
  String? five4;
  String? five5;
  String? five6;
  String? five7;

  String? six;
  String? six2;
  String? six3;
  String? six4;
  String? six5;
  String? six6;
  String? six7;

  String? seven;
  String? seven2;
  String? seven3;
  String? seven4;
  String? seven5;
  String? seven6;
  String? seven7;

  String? eight;
  String? eight2;
  String? eight3;
  String? eight4;
  String? eight5;
  String? eight6;
  String? eight7;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    final rawData7 = await rootBundle.loadString('assets/routinue/saturday.csv');
    final rawData = await rootBundle.loadString('assets/routinue/sunday.csv');
    final rawData2 = await rootBundle.loadString('assets/routinue/monday.csv');
    final rawData3 =
        await rootBundle.loadString('assets/routinue/tuesdayy.csv');
    final rawData4 =
        await rootBundle.loadString('assets/routinue/wednesdayy.csv');
    final rawData5 =
        await rootBundle.loadString('assets/routinue/thursdayy.csv');
    final rawData6 = await rootBundle.loadString('assets/routinue/friday.csv');

    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    List<List<dynamic>> listData2 =
        const CsvToListConverter().convert(rawData2);
    List<List<dynamic>> listData3 =
        const CsvToListConverter().convert(rawData3);
    List<List<dynamic>> listData4 =
        const CsvToListConverter().convert(rawData4);
    List<List<dynamic>> listData5 =
        const CsvToListConverter().convert(rawData5);
    List<List<dynamic>> listData6 =
        const CsvToListConverter().convert(rawData6);
    List<List<dynamic>> listData7 =
        const CsvToListConverter().convert(rawData7);

    String? batchToFilter = widget.batch;
    String? sectionToFilter = widget.section;

    _filteredValues = listData.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues2 = listData2.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues3 = listData3.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues4 = listData4.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues5 = listData5.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues6 = listData6.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    _filteredValues7 = listData7.where((row) {
      return row.isNotEmpty &&
          row[1].toString() == batchToFilter &&
          row[2].toString() == sectionToFilter;
    }).toList();

    if (_filteredValues.isNotEmpty) {
      if (_filteredValues[0].length > 10) {
        one = _filteredValues[0][3];
        two = _filteredValues[0][4];
        three = _filteredValues[0][5];
        four = _filteredValues[0][6];
        five = _filteredValues[0][7];
        six = _filteredValues[0][8];
        seven = _filteredValues[0][9];
        eight = _filteredValues[0][10];
      }
    }

    if (_filteredValues2.isNotEmpty) {
      if (_filteredValues2[0].length > 10) {
        one2 = _filteredValues2[0][3];
        two2 = _filteredValues2[0][4];
        three2 = _filteredValues2[0][5];
        four2 = _filteredValues2[0][6];
        five2 = _filteredValues2[0][7];
        six2 = _filteredValues2[0][8];
        seven2 = _filteredValues2[0][9];
        eight2 = _filteredValues2[0][10];
      }
    }

    if (_filteredValues3.isNotEmpty) {
      if (_filteredValues3[0].length > 10) {
        one3 = _filteredValues3[0][3];
        two3 = _filteredValues3[0][4];
        three3 = _filteredValues3[0][5];
        four3 = _filteredValues3[0][6];
        five3 = _filteredValues3[0][7];
        six3 = _filteredValues3[0][8];
        seven3 = _filteredValues3[0][9];
        eight3 = _filteredValues3[0][10];
      }
    }

    if (_filteredValues4.isNotEmpty) {
      if (_filteredValues4[0].length > 10) {
        one4 = _filteredValues4[0][3];
        two4 = _filteredValues4[0][4];
        three4 = _filteredValues4[0][5];
        four4 = _filteredValues4[0][6];
        five4 = _filteredValues4[0][7];
        six4 = _filteredValues4[0][8];
        seven4 = _filteredValues4[0][9];
        eight4 = _filteredValues4[0][10];
      }
    }

    if (_filteredValues5.isNotEmpty) {
      if (_filteredValues5[0].length > 10) {
        one5 = _filteredValues5[0][3];
        two5 = _filteredValues5[0][4];
        three5 = _filteredValues5[0][5];
        four5 = _filteredValues5[0][6];
        five5 = _filteredValues5[0][7];
        six5 = _filteredValues5[0][8];
        seven5 = _filteredValues5[0][9];
        eight5 = _filteredValues5[0][10];
      }
    }

    if (_filteredValues6.isNotEmpty) {
      if (_filteredValues6[0].length > 10) {
        one6 = _filteredValues6[0][3];
        two6 = _filteredValues6[0][4];
        three6 = _filteredValues6[0][5];
        four6 = _filteredValues6[0][6];
        five6 = _filteredValues6[0][7];
        six6 = _filteredValues6[0][8];
        seven6 = _filteredValues6[0][9];
        eight6 = _filteredValues6[0][10];
      }
    }

    if (_filteredValues7.isNotEmpty) {
      if (_filteredValues7[0].length > 10) {
        one7 = _filteredValues7[0][3];
        two7 = _filteredValues7[0][4];
        three7 = _filteredValues7[0][5];
        four7 = _filteredValues7[0][6];
        five7 = _filteredValues7[0][7];
        six7 = _filteredValues7[0][8];
        seven7 = _filteredValues7[0][9];
        eight7 = _filteredValues7[0][10];
      }
    }

    jSun = [one, two, three, four, five, six, seven, eight];
    jMon = [one2, two2, three2, four2, five2, six2, seven2, eight2];
    jTue = [one3, two3, three3, four3, five3, six3, seven3, eight3];
    jWed = [one4, two4, three4, four4, five4, six4, seven4, eight4];
    jThu = [one5, two5, three5, four5, five5, six5, seven5, eight5];
    jFri = [one6, two6, three6, four6, five6, six6, seven6, eight6];
    jSat = [one7, two7, three7, four7, five7, six7, seven7, eight7];

    setState(() {
      _isLoading = false; // End loading
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(batchToFilter);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Routine'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : Padding(
              padding: EdgeInsets.all(4.w),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        '${widget.batch} ${widget.section} Routine',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .2),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Table(
                        border: TableBorder.all(),
                        children: [
                          const TableRow(
                            children: [
                              SubjectClass(
                                title: 'Time\nDay',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '8:55\nto\n9:45\nAM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '9:50\nto\n10:40\nAM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '10:45\nto\n11:35\nAM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '11:40\nto\n12:30\nPM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '12:35\nto\n1:25\nPM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '1:30\nto\n2:10\nPM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '2:15\nto\n3.05\nPM',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '3:10\nto\n4.00\nPM',
                                color: Colors.red,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'SAT',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven7',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight7',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'SUN',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'MON',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven2',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight2',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'TUE',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven3',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight3',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'WED',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven4',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight4',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'THU',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven5',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight5',
                                color: Colors.black,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              const SubjectClass(
                                title: 'FRI',
                                color: Colors.red,
                              ),
                              SubjectClass(
                                title: '$one6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$two6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$three6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$four6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$five6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$six6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$seven6',
                                color: Colors.black,
                              ),
                              SubjectClass(
                                title: '$eight6',
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Write Batch'),
                                      content: SizedBox(
                                        height: 150.h,
                                        width: 150.w,
                                        child: Column(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              controller: batchController,
                                              decoration: const InputDecoration(
                                                  hintText: 'Batch'),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            TextFormField(
                                              controller: sectionController,
                                              decoration: const InputDecoration(
                                                  hintText: 'Section'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                foregroundColor: Colors.black),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                foregroundColor: Colors.black),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StuClassRoutine(
                                                    batch: batchController.text,
                                                    section: sectionController
                                                        .text
                                                        .toUpperCase(),
                                                  ),
                                                ),
                                                result: ModalRoute.of(context),
                                              );
                                            },
                                            child: const Text('Go'))
                                      ],
                                    );
                                  });
                            },
                            child: const Text('See Other Batch')),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class SubjectClass extends StatelessWidget {
  const SubjectClass({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.visible,
            fontSize: 12.23.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: .1,
            color: color,
          ),
        ),
      ),
    );
  }
}
