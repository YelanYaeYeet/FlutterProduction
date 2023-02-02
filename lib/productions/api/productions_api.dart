import 'package:gsheets/gsheets.dart';
import 'package:production/lib/model/production_field.dart';

class ProductionSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "mineral-acrobat-374902",
  "private_key_id": "d5c0a4cc195432f13a01050f0414765c318a4752",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDxrKVDqmWFaM0x\n2VHFFSDDC+0watdnXkUxh1Pt/ssXYH+qvUWIdOP5U04CTnAmy6+w5Nc/DWbqzjTx\n/UrdloPPK+6pwUEfBxNg++oB4Q2Buznd79LjjMCX0EYBADvGUmckA49z5uJXK/ZH\nWs8KRacltFg1vTciFGj5bdgY5wrlyITOidVW9njOb82SUDmPER/HEG/rtaK6HEn5\nC7k6m+PQu85Eex97oC/Qn/iOXbHymAAyDbZyloRSjsnRyvN9uiv5Lq44gW3ajfwY\ng0c1igXNOdSdcCPxso8H/f8x+VD4K5zokMXaORJRwO67H92GMxzwtMJBFNxZgSiv\n2zoVsolDAgMBAAECggEAHDVUFulRLziz1rEwf6n/KHUAaunVmZ2hwu2ySLG4P9LG\nJAYykwJdx7DHBrLkGUsmByY2z4e/bwHBoUs4zVNvsCNHGK5TbQ004FmXD0AXBQD2\n+KYw/dlkc3Peb+h4kaX1nvkBafxVh+o8NUjuqJrHrzl1IFSlFke+lvqQwhtZpMdA\nVFnd27QBDoe+E8JxKrwjZzNa1JBsecwBOuKkIlyPk7OycMOx6x5YOSVw+ohF5R3R\nJzg/qxxyEUmhOlXKwrfDCniirNcrlF9x3iQF74U/rqAzdoODcls58apr1NGQnw1F\nJOiVFDFy56iUpAxh33SeK5Oh9rKNg2mrEbUXyWw38QKBgQD43q7/K3OoYD8idQWA\nfYQSOOgsBvG4sWQZ/Vj7C6LFg+1jqMD1bO53ejD6gr/FXufyPVCV17GcdxrmURuT\nG8YeXK9AnZh5LwNCck/699k33Cz34XdrEJ5MezyOMVPTPsxmOhaHTo+KyzdAxsMN\nrTS9Tj46nuLxGL5VyYzSBEaZ0wKBgQD4mS/8BJgoLYGvxCMeOyfyYtflHrQd5jux\nLuwv4ovi+On84/ntlxO7MwVRi2Y41VutVnamtX76cJ8xh8d8V+Vem8oAtO9mkix1\noFBgntZDXLLEpesJK0jkbfzpONKwdHw9L0xYhdra+FLRfcp3d/33v7gWvauUExcb\n8aERfYi80QKBgFm2pKz1s/7Jm1jHiJE2LgsHmqJsamzi/avkyVPOcQH0ufnIFq8i\ncqB9WvSjd5Al00Ve1xL9K1i1Euxd5qvUQkolrUOEzDc7PFiSrsRQ3mwlocxF6e+d\nkQMPFdhIbehj5fkgDYj/R/2HnkZqoFvoyW9IqmQlbLfu7IYuXuZChlTjAoGBAKQI\nGBRXR7rDBB5g8bch22Lg+4mP79MGtn5b8rZJ6nlyOpqGJsQxenB74teCfomjpmFC\nevnXKhi/tRrud59BM/RwISLEQG7SpolapY6LX9+Ey+RbgjFDoU4wkL+mocaSpeON\nUPfcIqN3VNYsBSs9PpN5qlM/BXan/giPL/MlfNLxAoGBAOER7Oip6wWDvfS6OXTi\nl5cqec0EGVmYU/wMZC9WakLBeZym915kL94PjOVFL0Tb2TjmKdaUB7Ci6LzWITsB\ngfFpZVAYLvq1voRAcRes7AKQ7CrpESKZBblRV6qEQITUI0D9xNHqwsravVbzeVu7\nUeo0Z/tshjXb+fL7fde+w3BL\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@mineral-acrobat-374902.iam.gserviceaccount.com",
  "client_id": "112083772908052666805",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40mineral-acrobat-374902.iam.gserviceaccount.com"
}
''';

  static const _spreadsheetID = '12s7y6JGQdXuoMUQ53FJhzeSMrguhbjHf7pdgik6uYHY';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _productSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetID);
      _productSheet = await _getWorkSheet(spreadsheet, title: 'Production');

      final firstRow = ProductionField.getFields();
      _productSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_productSheet == null) {
      print("oh no");
    }
    _productSheet!.values.map.appendRows(rowList);
  }
}
