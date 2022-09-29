import 'package:apitestapp/res/widgets/round_button.dart';
import 'package:apitestapp/res/widgets/wgtnavebar.dart';
import 'package:apitestapp/res/widgets/widtextfield.dart';
import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:apitestapp/view_model/auth_view_model_provider.dart';
import 'package:apitestapp/view_model/vm_view_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/widgets/wgtdropdown.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  vm_view_area vm = vm_view_area();
  final List<String> subjects = ["Computer Science", "Biology", "Math"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(RoutesName.AddProduct),
      ),
      drawer: WgtNavebar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20),
            children: getFormWidget(),
          ),
        ),
      ),
    );
  } // end of body

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];
    // buttons
    formWidget.add(
      Row(
        children: [
          Expanded(
              child: RoundButton(
            title: "Add Product",
            onPress: () {},
          )),
          Expanded(
              child: RoundButton(
            title: "View Product",
            onPress: () {},
          )),
        ],
      ),
    );
    // form fields
    formWidget.add(measurements());
    // submit buttons
    formWidget.add(IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RoundButton(
              onPress: (() {
                if (_formKey.currentState!.validate()) {}
              }),
              title: "Save",
            ),
          ),
          Expanded(
            child: RoundButton(
              onPress: (() {}),
              title: "Reset",
            ),
          ),
        ],
      ),
    ));
    return formWidget;
  }

  Visibility measurements() {
    return Visibility(
      visible: true,
      child: IntrinsicHeight(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: (MyDropDown(
            subjects: subjects,
            labelText: "Company/Manufacturer",
          ))),
          Expanded(
            child: MyTextField(
              txt_type: TextInputType.text,
              labelText: "Product Name",
              value: "",
              controller: vm.area,
            ),
          ),
          Expanded(
            child: MyTextField(
              txt_type: TextInputType.text,
              labelText: "Bar Code",
              value: "",
              controller: vm.areacode,
            ),
          ),
          Expanded(
              child: (MyDropDown(
            subjects: subjects,
            labelText: "Primary Unit",
          ))),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Secoundary Unit Size",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Toal Size",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Purchase Price Secoundary Unit",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Trade Price Secoundary Unit",
            value: "",
            controller: vm.areacode,
          ),
          MyDropDown(
            subjects: subjects,
            labelText: "Product Group",
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Code",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Location",
            value: "",
            controller: vm.areacode,
          ),
          MyDropDown(
            subjects: subjects,
            labelText: "Secondary Unit",
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Secondary Unit Quantity",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Purchase Price Primary Unit",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Trade Price Primary Unit",
            value: "",
            controller: vm.areacode,
          ),
          MyTextField(
            txt_type: TextInputType.text,
            labelText: "Opening Stock Primary Unit",
            value: "",
            controller: vm.areacode,
          ),
        ]),
      ),
    );
  }
}
