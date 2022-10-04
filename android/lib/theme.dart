import 'package:hive_flutter/hive_flutter.dart';

class ThememodeClass {
  final _themeBox = Hive.box('theme_box');
  // Update a single item
  Future<void> updateItem({required Map<String, dynamic> item}) async {
    final firstvalue = _themeBox.get(0);
    if (firstvalue != null) {
      await _themeBox.put(0, item);
      readMode();
    } else {
      print("not updated in themebox");
      createItem(item);
    }
  }

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _themeBox.add(newItem);
    print("created night mode day mode in themebox");
  }

  //todo read single item from the database by using its key
  bool readMode() {
    final item = _themeBox.get(0);
    if (item == null) {
      createItem({
        "darkmode": false,
      });
    }
    bool useDarkclass;
    print(item.toString());
    // print(
    //     "this is darkmood $item['darkmode'] and ${item['darkmode'].runtimeType} in themeclass");
    return useDarkclass = (item == null) ? false : item['darkmode'];
  }
}
