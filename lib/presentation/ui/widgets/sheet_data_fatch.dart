import 'package:my_campus/presentation/ui/widgets/sheet_connect_api.dart';
import 'package:flutter/foundation.dart';

List dataFromSheet = [];
readDataFromSheet() async {
  try {
    if (gSheetCrudUserDetails != null) {
      dataFromSheet = (await gSheetCrudUserDetails!.values.map.allRows())!;

      if (dataFromSheet.isNotEmpty) {
        if (kDebugMode) {
          print("Data Fetched Successfully");
        }
      } else {
        if (kDebugMode) {
          print("No Data Found");
        }
      }
    } else {
      if (kDebugMode) {
        print("Worksheet is null");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error fetching data: $e");
    }
  }
}
