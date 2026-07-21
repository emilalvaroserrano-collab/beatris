import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = 'homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FlutterFlowWebView(
          content:
              '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta\n    name=\"viewport\"\n    content=\"width=device-width, initial-scale=1, viewport-fit=cover\"\n  />\n\n  <title>Dual Translator</title>\n\n  <!-- Allow microphone and related browser features -->\n  <meta\n    http-equiv=\"Permissions-Policy\"\n    content=\"microphone=*, camera=*, autoplay=*, fullscreen=*\"\n  />\n\n  <style>\n    * {\n      box-sizing: border-box;\n    }\n\n    html,\n    body {\n      width: 100%;\n      height: 100%;\n      margin: 0;\n      padding: 0;\n      overflow: hidden;\n      background: #000;\n    }\n\n    #translator-frame {\n      position: fixed;\n      inset: 0;\n      width: 100vw;\n      height: 100dvh;\n      border: 0;\n      margin: 0;\n      padding: 0;\n      display: block;\n      background: #000;\n    }\n  </style>\n</head>\n\n<body>\n  <iframe\n    id=\"translator-frame\"\n    src=\"https://dualtranslator.eburon.ai/\"\n    title=\"Eburon Dual Translator\"\n    allow=\"microphone *; camera *; autoplay *; fullscreen *; clipboard-read *; clipboard-write *\"\n    allowfullscreen\n    webkitallowfullscreen\n    referrerpolicy=\"strict-origin-when-cross-origin\"\n  ></iframe>\n\n  <script>\n    const frame = document.getElementById(\"translator-frame\");\n\n    // Attempt fullscreen after the first user interaction.\n    async function enableFullscreen() {\n      try {\n        if (!document.fullscreenElement) {\n          await document.documentElement.requestFullscreen();\n        }\n      } catch (error) {\n        console.warn(\"Fullscreen request was blocked:\", error);\n      }\n    }\n\n    document.addEventListener(\"click\", enableFullscreen, { once: true });\n    document.addEventListener(\"touchstart\", enableFullscreen, { once: true });\n\n    frame.addEventListener(\"load\", () => {\n      frame.focus();\n    });\n  </script>\n</body>\n</html>',
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          verticalScroll: true,
          horizontalScroll: false,
          html: true,
        ),
      ),
    );
  }
}
