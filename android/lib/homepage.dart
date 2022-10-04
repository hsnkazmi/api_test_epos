import 'package:flutter/material.dart';
import 'package:myreader/testnew/pdfviewrcashed.dart';
import 'package:myreader/utils/neumorphic_extention.dart';
import 'package:theme_provider/theme_provider.dart';
import 'bookmarksinfo.dart';

class AudioPlayerSample extends StatelessWidget {
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
            home: const MyContainer(),
          ),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = ThemeProvider.controllerOf(context);

    return Scaffold(
      bottomNavigationBar: _buildControlsBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              //! BG CONTAINER
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                    top: size.height * .12 - 20,
                    left: size.width * .1,
                    right: size.width * .02),
                height: size.height * .48 - 90,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.black),
                child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => MyCashedPdf()));
                    },
                    child: BookInfo(context, size)),
              ),

              //! theme changer
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: MaterialButton(
                    // padding: const EdgeInsets.all(18.0),
                    onPressed: controller.nextTheme,

                    child: ImageIcon(
                      const AssetImage("assets/images/night.png"),
                      color: controller.currentThemeId == "light"
                          ? Colors.white
                          : _iconsColor(),
                    ),
                  ),
                ).addNeumorphism(),
              )
            ]),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Bookmarksinfo(),
            )),
          ],
        ),
      ),
    );
  }

//! CONTROLL BAR LINKS
  Widget _buildControlsBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: Image.asset(
              "assets/images/gplay.png",
              height: 33,
              width: 33,
            ),
          ).addNeumorphism(),
        ),
        const SizedBox(
          width: 22,
        ),
        Expanded(
          child: MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: Image.asset(
              "assets/images/rate.png",
              height: 33,
              width: 33,
            ),
          ).addNeumorphism(),
        ),
        const SizedBox(
          width: 22,
        ),
        Expanded(
          child: MaterialButton(
            padding: const EdgeInsets.all(8.0),
            onPressed: () {},
            child: Image.asset(
              "assets/images/privacy.png",
              height: 33,
              width: 33,
            ),
          ).addNeumorphism(),
        ),
      ],
    ).addNeumorphism();
  }

  Color _iconsColor() {
    return Colors.blueAccent;
  }

  Widget BookInfo(BuildContext context, Size size) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * .002),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "امر بیل",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(fontSize: 30, fontFamily: 'urdu'),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyCashedPdf()));
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * .006),
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).bottomAppBarColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black38)),
                              child: Row(
                                children: [
                                  Icon(Icons.read_more),
                                  Text(
                                    "Read Here",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ).addNeumorphism(),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.transparent,
            child: Image.asset(
              "assets/images/amar.png",
              height: double.infinity,
              alignment: Alignment.topRight,
              fit: BoxFit.fitWidth,
            ),
          ).addNeumorphism(),
        ),
      ],
    );
  }
}
