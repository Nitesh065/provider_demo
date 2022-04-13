import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/modal/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _ThemeAppBar(
          title: Text("Theme Provider Demo"),
          actions: [
            IconButton(
                onPressed: () => _showColorPicker(context),
                icon: Icon(Icons.colorize_sharp))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) => Text(
                  "Text",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: themeProvider.mainColor),
                ),
              ),
              Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) => Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                        ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: themeProvider.mainColor),
                      )),
              Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) => Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: themeProvider.mainColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      )),
              Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) => Slider(
                        onChanged: (value) {},
                        activeColor: themeProvider.mainColor,
                        inactiveColor: themeProvider.mainColor.withOpacity(0.5),
                        value: 0,
                      )),
              Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) => Switch(
                      value: true,
                      onChanged: (new_value) {},
                      activeColor: themeProvider.mainColor))
            ],
          ),
        ));
  }

  void _showColorPicker(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context, listen: false);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Wrap(
                children: [
                  ColorPicker(
                      pickerColor: themeProvider.mainColor,
                      onColorChanged: (color) =>
                          themeProvider.changeThemeColor(color))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close"))
              ],
            ));
  }
}

class _ThemeAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;

  final Size preferredSize;
  _ThemeAppBar({this.title, this.actions})
      : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => AppBar(
              title: title,
              actions: actions,
              backgroundColor: themeProvider.mainColor,
            ));
  }
}
