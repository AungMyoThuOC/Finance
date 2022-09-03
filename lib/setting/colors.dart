import 'package:flutter/material.dart';

import '../presentationColr/shared/page_wrapper.dart';
import '../presentationColr/widgets/priary_color_switcher.dart';
import '../presentationColr/widgets/theme_switcher.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Colors"),
      ),
      body: PageWrapper(
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ThemeSwitcher(),
            SizedBox(
              height: 20,
            ),
            PrimaryColorSwitcher(),
          ],
        )
      ),
    );
  }
}
