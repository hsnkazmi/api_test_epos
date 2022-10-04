import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:myreader/testnew/pdfviewrcashed.dart';
import 'package:myreader/testnew/sfpdfviewr.dart';
import 'package:theme_provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: false,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        String? savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          Brightness platformBrightness =
              // SchedulerBinding.instance.window.platformBrightness ??
              Brightness.light;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme.light(id: 'light'),
        AppTheme.dark(id: 'dark'),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);

    return Scaffold(
      appBar: AppBar(title: Text("Example App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: controller.nextTheme,
              child: Row(
                children: [
                  Center(
                    child: controller.currentThemeId == "light"
                        ? Icon(
                            Icons.light_mode_rounded,
                            color: Colors.yellow,
                          )
                        : Icon(
                            Icons.dark_mode_rounded,
                            color: Colors.white,
                          ),
                    //child: Text("Next Theme"),
                  ),
                  Text(controller.currentThemeId)
                ],
              ),
            ),
            _buildButton(
              text: "Second Screen",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SecondPage()));
              },
            ),
            Divider(),
            _buildButton(
              text: "Second pdf",
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyCashedPdf()));
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required String text, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Row(
        children: [
          Center(
            child: IconButton(
              icon:
                  ThemeProvider.controllerOf(context).currentThemeId == "light"
                      ? Icon(
                          Icons.light_mode_rounded,
                          color: Colors.yellow,
                        )
                      : Icon(
                          Icons.dark_mode_rounded,
                          color: Colors.white,
                        ),
              //child: Text("Next Theme"),
              onPressed: ThemeProvider.controllerOf(context).nextTheme,
            ),
          ),
          Text(ThemeProvider.controllerOf(context).currentThemeId)
        ],
      ),
    );
  }
}
