import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String? appbarTitle;
  final Widget body;
  final List<Widget>? appbarActions;
  const CustomScaffold({super.key, this.appbarTitle, required this.body, this.appbarActions});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent.shade100,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: appbarTitle != null
                ? Text(
                    appbarTitle!,
                    style: const TextStyle(fontSize: 27),
                  )
                : null,
            backgroundColor: Colors.amber,
            actions: appbarActions != null ? appbarActions! : [],
          ),
          body: Container(color: Colors.amberAccent.shade100, child: body),
        ),
      ),
    );
  }
}
