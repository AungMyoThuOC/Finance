import 'package:finance/presentationColr/providers/theme_provider.dart';
import 'package:finance/presentationColr/styles/app_colors.dart';
import 'package:finance/presentationColr/widgets/primary_color_option.dart';
import 'package:finance/presentationColr/widgets/switcher_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrimaryColorSwitcher extends StatelessWidget {
  const PrimaryColorSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitcherContainer(
        title: 'Primary Color',
        content: Consumer<ThemeProvider>(
          builder: (c, themeProvider, _) {
            return Wrap(
              children: List.generate(
                  AppColors.primaryColorOptions.length,
                  (i) => PrimaryColorOption(
                        color: AppColors.primaryColorOptions[i],
                        isSelected: themeProvider.selectedPrimaryColor ==
                            AppColors.primaryColorOptions[i],
                        onTap: () => themeProvider.setSelectedPrimarycolor(
                            AppColors.primaryColorOptions[i]
                        ),
                      )
                    ),
            );
          },
        )
      );
  }
}
