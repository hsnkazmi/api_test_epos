import 'package:apitestapp/res/widgets/round_button.dart';
import 'package:apitestapp/res/widgets/wgtnavebar.dart';
import 'package:apitestapp/res/widgets/widtextfield.dart';
import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:apitestapp/view_model/auth_view_model_provider.dart';
import 'package:apitestapp/view_model/vm_view_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({super.key});

  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final _formKey = GlobalKey<FormState>();
  vm_view_area vm = vm_view_area();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(RoutesName.AddCompany),
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
            title: "Add Company Name",
            onPress: () {},
          )),
          Expanded(
              child: RoundButton(
            title: "View Company Name",
            onPress: () {},
          )),
        ],
      ),
    );
    // form fields
    formWidget.add(measurements());
    // submit buttons
    formWidget.add(Row(
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
    ));
    return formWidget;
  }

  Visibility measurements() {
    return Visibility(
      visible: true,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        MyTextField(
          txt_type: TextInputType.text,
          labelText: "Company Name",
          value: "",
          controller: vm.area,
        ),
        MyTextField(
          txt_type: TextInputType.text,
          labelText: "Compnay Code",
          value: "",
          controller: vm.areacode,
        ),
      ]),
    );
  }
}
