import 'package:flutter/foundation.dart';
import 'package:gsheets/gsheets.dart';

var sheetId = "1VBIEviRbzBFdLrK8-RRDzvT0wQKLNbjmrOMn838o844";
var credentials = r'''{
  "type": "service_account",
  "project_id": "mycampus-routine-fatch",
  "private_key_id": "c94bba3e877d666492e876c0e5df8f02fa103340",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDMXmUX9ewubiJK\nojZAHQZrpkyZjRYbK7ISz2XljtFZ+3nnbIECLADcdFbGVf0rzeKRom8uFOzK8iJb\nxBjnJnD1//Qb5bfFSf1LeoUvzTxrIxGb40LlZHGchLcC9QW3/3eLBTWxwDeyACir\nbhOvg+XGNeopWLjjC5V23O1EyVgzcJ5Hvd+TroFFZqf70h4vWzQWmstt6gbqOg06\nUrNLtPK0mxQvXju9/XpXai4wG6D3NxDhK+Rh7iCkLu49JCZFHnuZnE+QJzT1zgJl\nQvoulZIeNLe6g6pz+Z/j+jxPXRukco0vKobdksPKO4RggeNTco3Lzhhvkuj6k9dh\njMbSxENxAgMBAAECggEAUqqeLuaBjjhrc5AQ7Lcw6SuAEZ6RwhTXN6ef+o7eHQ1N\nfrCTsJq3EHWYwip3OZhS3QD9AwFg1SjDgCYewqV4jPFnPz+ZKdsnc7gQFslodpfd\nYBa58QtDr4G5e588HHTgWKIXWZq8jKpmyQ1CNj1enOIjIW1rgB+n6kgsS6Y8ILXk\ndTPpdBnN8Nud1BusIs8t753QLaQzSdJt6tzXHs3Qu0Tzji7qvP1BZwHJLHQclWfo\nW2v5gSy0gOCw9YRqsHwNGDB1VDm/JaSYqcRhP9/msDGs03hsLaEH0qLPmUqRlRi5\n3NjSYdv4TLruJ57godNfQgYxMMEPB3nhvirZy9SJHwKBgQDwFWhgiIrkc8Isz21T\n2Xn5EQNdYzRL5OHlfQG8Y7JJJWxE+wC6nKuYbyKeEZkRXXOt0bHsoZpgPHXWaZOQ\n0lRC8xVaxKo8OhaoocJqsZaWh9NdJ8Zf11lum4wnX7dZWRIVJZAusqRaXh4hGlPm\nFPa+sPqEbTzQXHB/Dnr5T56aqwKBgQDZ6tmTxGKeZDR4AjPgMHJRifYWw1ixEbe0\nCYV1qpkN0QvLjFDdQNIeIBXFKYzITRFufbY1VP0PSq2POPat9Wb3fPaav0f2EauJ\niucQTKWwgkGwRuRANzTxemOGRgWsM+DqeeCTsi2F5gzqCTDq7EY2WkrOITn0A0pQ\nOgh4P+haUwKBgQC2DJWkNYWUa86+qd9N6Kfb3DG/+7ypG/rLSLorPzHu00jBGc/Y\nsXpQ0VzfnZqDF2jjUhHnzDbCaLY2CsKR21t3lNoJhP1NRALwhhBlVRpKNN5qUgHT\npPk0rRBevu7J+oeCr4QgVOfZemrAUTVzT0w3Fv4vsqGdoarQPYu0RtKOlwKBgC0M\na6YsduafeGlGq0qxOTC6AHF8OJ2COCOzxC8q8TD2AiY1/5F9kPJBV77GdCAELpJU\n0pH728SJf4+YCwazMHIBF0muOUYZKQjp+hJYhfgTNVknjo/n2b4BuwlK+Gk84EYY\no+BkeRyxDgJjnAU0it85kzVBkSVseLRVCuMw8uuZAoGBANSSQm7fgk+/5Ju4P0Dj\nNRX8ZJcKwS/NzZb5rPHmYqphMMoCYh7rOWaahtS0oQISpNnJTH3P2akIdQHRMN2x\n5It9qFd0Y6et/4eKoTtMoI0Yn6szy2bKU3Rg0pPIuKTLecDKQ9xo8cX9fxVjQPOK\n0MIoA6yX5zhJAoumSxN7DJqV\n-----END PRIVATE KEY-----\n",
  "client_email": "class-routine@mycampus-routine-fatch.iam.gserviceaccount.com",
  "client_id": "110207516593260149124",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/class-routine%40mycampus-routine-fatch.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
 ''';

final gSheetInit = GSheets(credentials);
var gSheetController;
Worksheet? gSheetCrudUserDetails;
// Function to get current day name
String getCurrentDayName() {
  DateTime now = DateTime.now();
  String dayName = now.weekday == 1
      ? 'Monday'
      : now.weekday == 2
          ? 'Tuesday'
          : now.weekday == 3
              ? 'Wednesday'
              : now.weekday == 4
                  ? 'Thursday'
                  : now.weekday == 5
                      ? 'Friday'
                      : now.weekday == 6
                          ? 'Saturday'
                          : 'Sunday';
  return dayName;
}

gSheetIntit() async {
  try {
    gSheetController = await gSheetInit.spreadsheet(sheetId);
    String currentDayName = getCurrentDayName();
    gSheetCrudUserDetails =
        await gSheetController.worksheetByTitle(currentDayName);

    if (gSheetCrudUserDetails != null) {
      if (kDebugMode) {
        print("Google Sheets connected successfully");
        print(currentDayName);
      }
    } else {
      if (kDebugMode) {
        print("Failed to connect to Google Sheets");
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error connecting to Google Sheets: $e");
    }
  }
}
