import 'package:apitestapp/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class WgtNavebar extends StatelessWidget {
  const WgtNavebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("Kazmi@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "Kazmi",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          widmenue(
              icon: Icons.home, link: "Home", routname: RoutesName.addarea),
          //settings
          widexpention(
            icon: Icons.settings,
            link: "Settings",
            children: [
              widmenue(
                  icon: Icons.area_chart,
                  link: "Sale Area",
                  routname: RoutesName.addarea),
              widmenue(
                  icon: Icons.home,
                  link: "Add Company",
                  routname: RoutesName.AddCompany),
              widmenue(
                  icon: Icons.production_quantity_limits,
                  link: "Product Group",
                  routname: RoutesName.ProductGroup),
              widmenue(
                  icon: Icons.ac_unit_rounded,
                  link: "Product Unit",
                  routname: RoutesName.ProductUnit),
              widmenue(
                  icon: Icons.add,
                  link: "Add Product",
                  routname: RoutesName.AddProduct),
              widmenue(
                  icon: Icons.verified_user,
                  link: "Add Sale Men",
                  routname: RoutesName.AddSaleMen),
              widmenue(
                  icon: Icons.verified_user,
                  link: "Add Expense Type",
                  routname: RoutesName.AddExpenseType),
            ],
          ),
          // Customer
          widexpention(
            icon: Icons.group,
            link: "Customer",
            children: [
              widmenue(
                  icon: Icons.area_chart,
                  link: "Add Cutomer",
                  routname: "rout"),
              widmenue(
                  icon: Icons.home, link: "Customer Ledger", routname: "rout"),
              widmenue(
                  icon: Icons.production_quantity_limits,
                  link: "Customer Payments",
                  routname: "rout"),
              widmenue(
                  icon: Icons.adjust,
                  link: "Payment Adjustment",
                  routname: "rout"),
            ],
          ),
          // Suppliers
          widexpention(
            icon: Icons.group,
            link: "Suppliers",
            children: [
              widmenue(
                  icon: Icons.support, link: "Add Suppliers", routname: "rout"),
              widmenue(
                  icon: Icons.home, link: "Suppliers Ledger", routname: "rout"),
              widmenue(
                  icon: Icons.production_quantity_limits,
                  link: "Payments",
                  routname: "rout"),
              widmenue(
                  icon: Icons.adjust, link: "Adjustment", routname: "rout"),
            ],
          ),
          // Sale
          widexpention(
            icon: Icons.scale,
            link: "Sale",
            children: [
              widmenue(icon: Icons.area_chart, link: "Sale", routname: "rout"),
              widmenue(icon: Icons.home, link: "Return", routname: "rout"),
              widmenue(
                  icon: Icons.production_quantity_limits,
                  link: "Rounds",
                  routname: "rout"),
            ],
          ),
          //purchase
          widexpention(
            icon: Icons.scale,
            link: "Purchase",
            children: [
              widmenue(
                  icon: Icons.area_chart, link: "Purchase", routname: "rout"),
              widmenue(icon: Icons.home, link: "Return", routname: "rout"),
            ],
          ),
          // Reports
          widexpention(
            icon: Icons.scale,
            link: "Reports",
            children: [
              widmenue(icon: Icons.report, link: "Business", routname: "rout"),
              widmenue(icon: Icons.report, link: "Stock", routname: "rout"),
              widmenue(icon: Icons.eco_outlined, link: "ETC", routname: "rout"),
            ],
          ),
          // Lists
          widexpention(
            icon: Icons.list,
            link: "List",
            children: [
              widmenue(
                  icon: Icons.picture_in_picture_alt_sharp,
                  link: "Purchase List",
                  routname: "rout"),
              widmenue(
                  icon: Icons.sd_card_alert,
                  link: "Sale List",
                  routname: "rout"),
              widmenue(
                  icon: Icons.dashboard_customize_rounded,
                  link: "Customer List",
                  routname: "rout"),
              widmenue(
                  icon: Icons.dashboard_customize_rounded,
                  link: "Product List",
                  routname: "rout"),
            ],
          ),
        ],
      ),
    );
  }
}

class widexpention extends StatelessWidget {
  widexpention(
      {required this.icon, required this.link, required this.children});
  final String link;
  final IconData icon;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(link),
        leading: Icon(icon), //add icon
        childrenPadding: EdgeInsets.only(left: 60), //children padding
        children: children);
  }
}

class widmenue extends StatelessWidget {
  widmenue({
    required this.icon,
    required this.link,
    required this.routname,
  });
  IconData icon;
  String link;
  String routname;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(link),
      onTap: () {
        //Navigator.pop(context);
        Navigator.pushNamed(context, routname);
      },
    );
  }
}
