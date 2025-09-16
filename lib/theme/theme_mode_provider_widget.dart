import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'theme_view_model.dart';

class ThemeModeProviderWidget extends StatefulWidget {
  const ThemeModeProviderWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ThemeModeProviderWidget> createState() => _ThemeModeProviderWidgetState();
}

class _ThemeModeProviderWidgetState extends State<ThemeModeProviderWidget> {
  late final themeViewModel = GetIt.instance.get<ThemeViewModel>();

  @override
  void initState() {
    super.initState();
    themeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode?>(
      stream: themeViewModel.themeMode,
      initialData: themeViewModel.themeMode.valueOrNull,
      builder: (context, snapshot) {

        return ThemeModeProvider(
          currentThemeMode: snapshot.data ?? ThemeMode.system,
          themeModeCallback: themeViewModel.setDarkMode,
          child: widget.child,
        );
      },
    );
  }
}

typedef ThemeModeCallback = void Function(ThemeMode themeMode);

class ThemeModeProvider extends InheritedWidget {
  const ThemeModeProvider({
    super.key,
    required Widget child,
    required this.currentThemeMode,
    required this.themeModeCallback,
  }) : super(child: child);

  final ThemeMode currentThemeMode;
  final ThemeModeCallback themeModeCallback;

  static ThemeModeProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeModeProvider>();
    assert(result != null, 'No ThemeModeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeModeProvider oldWidget) {
    return currentThemeMode != oldWidget.currentThemeMode;
  }
}
