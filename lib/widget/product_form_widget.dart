import 'package:flutter/material.dart';
import 'package:production/lib/model/production_field.dart';
import 'package:production/widget/button_widget.dart';
import 'package:production/widget/pick_up_widget.dart';

class ProductFormWidget extends StatefulWidget {
  final ValueChanged<Products> onSavedProducts;

  const ProductFormWidget({
    Key? key,
    required this.onSavedProducts,
  }) : super(key: key);

  @override
  _ProductFormWidgetState createState() => _ProductFormWidgetState();
}

class _ProductFormWidgetState extends State<ProductFormWidget> {
  final formKey = GlobalKey<FormState>();
  String? _monthValue, _yearValue, _nameValue, _zoneValue;
  int error = 1;
  late TextEditingController controllerNumber;
  late TextEditingController controllerWeight;

  @override
  void initState() {
    super.initState();

    initEnter();
  }

  void initEnter() {
    controllerNumber = TextEditingController();
    controllerWeight = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildPickUp(),
              const SizedBox(
                height: 16,
              ),
              buildQuantity(),
              const SizedBox(
                height: 16,
              ),
              buildWeight(),
              const SizedBox(
                height: 16,
              ),
              buildSummit(),
            ],
          ),
        ),
      );

  Widget buildPickUp() => ProductChoice(
        onMonthChange: (value) {
          setState(() {
            _monthValue = value;
          });
        },
        onYearChange: (value) {
          setState(() {
            _yearValue = value;
          });
        },
        onNameChange: (value) {
          setState(() {
            _nameValue = value;
          });
        },
        onZoneChange: (value) {
          setState(() {
            _zoneValue = value;
          });
        },
      );
  Widget buildQuantity() => TextFormField(
        controller: controllerNumber,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Quantity',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter Weight';
          }

          int weight;
          try {
            weight = int.parse(value);
          } catch (e) {
            return 'Weight must be an integer';
          }
          return null;
        },
      );

  Widget buildWeight() => TextFormField(
        controller: controllerWeight,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Weight',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter Weight';
          }

          int weight;
          try {
            weight = int.parse(value);
          } catch (e) {
            return 'Weight must be an integer';
          }
          return null;
        },
      );

  Widget buildSummit() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          final form = formKey.currentState!;
          final isValid = form.validate();

          if ((_monthValue == null) ||
              (_monthValue == null) ||
              (_nameValue == null) ||
              (_zoneValue == null)) {
            error = 0;
          } else {
            error = 1;
          }

          if (error == 0) {
            print("click button");
          } else if (!isValid) {
            print("enter");
          } else {
            final products = Products(
              year: _yearValue,
              month: _monthValue,
              name: _nameValue,
              zone: _zoneValue,
              weight: controllerWeight.text,
              quantity: controllerNumber.text,
            );
            widget.onSavedProducts(products);
          }
        },
      );
}
