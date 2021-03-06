import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zelda_guide/presentation/core/app_theme.dart';
import 'package:zelda_guide/presentation/core/widgets/sheika_ui/glow.dart';

class SheikaTabBar extends StatefulWidget {
  const SheikaTabBar({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<SheikaTab> tabs;

  @override
  State<SheikaTabBar> createState() => SheikaTabBarState();
}

class SheikaTabBarState extends State<SheikaTabBar>
    with SingleTickerProviderStateMixin {
  int _activeIndex = 0;

  @override
  void didChangeDependencies() {
    if (DefaultTabController.of(context) != null) {
      DefaultTabController.of(context)!.addListener(() {
        setState(() {
          _activeIndex = DefaultTabController.of(context)!.index;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    const double _indicatorWeight = 0.6;
    String _selectedName = widget.tabs.elementAt(_activeIndex).name;

    return Column(
      children: [
        Glow(
          spreadRadius: 4,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: Text(
              _selectedName,
              // This key causes the AnimatedSwitcher to interpret this as a "new"
              key: ValueKey<String>(_selectedName),
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: AppTheme.blueSheika,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppTheme.blueSheika.withAlpha(100),
                width: _indicatorWeight,
              ),
            ),
          ),
          child: TabBar(
            indicatorWeight: _indicatorWeight,
            indicatorColor: AppTheme.blueSheika,
            isScrollable: true,
            tabs: widget.tabs
                .map(
                  (tab) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity:
                          _activeIndex == widget.tabs.indexOf(tab) ? 1 : 0.4,
                      child: Tab(
                        icon: Glow(
                          child: SvgPicture.asset(
                            tab.assetName,
                            width: tab.width,
                            semanticsLabel: tab.semanticLabel,
                            color: AppTheme.blueSheika,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class SheikaTab {
  const SheikaTab({
    required this.name,
    required this.assetName,
    required this.width,
    required this.semanticLabel,
  });

  final String name;
  final String assetName;
  final double width;
  final String semanticLabel;
}
