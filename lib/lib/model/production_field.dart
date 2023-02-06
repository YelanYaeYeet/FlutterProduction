class ProductionField {
  static const String year = 'year';
  static const String month = 'month';
  static const String zone = 'zone';
  static const String name = 'name';
  static const String quantity = 'quantity';
  static const String weight = 'weight';

  static List<String> getFields() =>
      [year, month, zone, name, quantity, weight];
}

class Products {
  final String? year;
  final String? month;
  final String? zone;
  final String? name;
  final String? quantity;
  final String? weight;

  Products(
      {required this.year,
      required this.month,
      required this.zone,
      required this.name,
      required this.quantity,
      required this.weight});

  Map<String, dynamic> toJson() => {
        ProductionField.year: year,
        ProductionField.month: month,
        ProductionField.zone: zone,
        ProductionField.name: name,
        ProductionField.quantity: quantity,
        ProductionField.weight: weight,
      };

  factory Products.fromGsheets(Map<String, dynamic> json) {
    return Products(
        year: json['month'],
        month: json['month'],
        zone: json['zone'],
        name: json['name'],
        quantity: json['quantity'],
        weight: json['weight']);
  }

  Map<String, dynamic> toGsheets() {
    return {
      'year': year,
      'month': month,
      'zone': zone,
      'name': name,
      'quantity': quantity,
      'weight': weight,
    };
  }
}

