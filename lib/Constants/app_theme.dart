/// Creating custom color palettes is part of creating a custom app. The idea is to create
/// your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
/// object with those colors you just defined.
///
/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
/// You simply need to put in the colour you wish to use, and it will generate all shades
/// for you. Your primary colour will be the `500` value.
///
/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your theme, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
///
/// Usage:
/// In order to use this newly created theme or even the colours in it, you would just
/// `import` this file in your project, anywhere you needed it.
/// `import 'path/to/theme.dart';`
import 'package:flutter/material.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainer,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        // contentTextStyle: _textTheme.bodySmall!.apply(color: _darkFillColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.outlineVariant,
        ),
        filled: true,
        fillColor: colorScheme.surface,
        outlineBorder: BorderSide(
          color: colorScheme.outlineVariant,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(8),
          backgroundColor: colorScheme.surface,
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all<Color>(
          colorScheme.primary,
        ),
        fillColor: WidgetStateProperty.all(
          Colors.transparent,
        ),
        side: WidgetStateBorderSide.resolveWith(
          (states) {
            return BorderSide(
              width: 1.5,
              color: states.contains(WidgetState.selected)
                  ? colorScheme.primary
                  : colorScheme.outline,
            );
          },
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0052CC),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCBE6FF),
    onPrimaryContainer: Color(0xFF001E30),
    secondary: Color(0xFF87CEEB),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD9E2FF),
    onSecondaryContainer: Color(0xFF001944),
    tertiary: Color(0xFFFFA500),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFDBE1FF),
    onTertiaryContainer: Color(0xFF00184A),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF001F3F),
    surfaceContainer: Color(0xFFF5F5F5),
    onSurfaceVariant: Color(0xFF42474D),
    outline: Color(0xFF333333),
    onInverseSurface: Color(0xFFF0F0F3),
    inverseSurface: Color(0xFF2F3133),
    inversePrimary: Color(0xFF8BCAFF),
    shadow: Color(0x1A0052CC),
    surfaceTint: Color(0xFF90CDFF),
    outlineVariant: Color(0xFF7E7E7E),
    scrim: Color(0xFF000000),
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF0065FC),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0x1A767C9E),
    onPrimaryContainer: Color(0xFFCBE6FF),
    secondary: Color(0xFFAFC6FF),
    onSecondary: Color(0x40767C9E),
    secondaryContainer: Color(0xFF17438F),
    onSecondaryContainer: Color(0xFFD9E2FF),
    tertiary: Color(0xFFB3C5FF),
    onTertiary: Color(0xFF002A76),
    tertiaryContainer: Color(0xFF003FA5),
    onTertiaryContainer: Color(0xFFDBE1FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1A1C1E),
    onBackground: Color(0xFFE2E2E5),
    surface: Color(0xFF2A2C38),
    onSurface: Color(0xFFC6DFF9),
    surfaceContainer: Color(0x40767C9E),
    surfaceVariant: Color(0xFF42474D),
    onSurfaceVariant: Color(0xFFC1C7CE),
    outline: Color(0xFFCCCCCC),
    onInverseSurface: Color(0xFF1A1C1E),
    inverseSurface: Color(0xFFE2E2E5),
    inversePrimary: Color(0xFF006495),
    shadow: Color(0x1AFFFFFF),
    surfaceTint: Color(0xFF90CDFF),
    outlineVariant: Color(0xFF767C9E),
    scrim: Color(0xFF000000),
  );
}
