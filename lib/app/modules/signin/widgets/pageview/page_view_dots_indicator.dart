import 'package:flutter/material.dart';

class PageViewDotsIndicator extends StatelessWidget {
  const PageViewDotsIndicator({
    Key key,
    @required this.indicatorsIconsArray,
    @required int currentPageViewIndex,
  }) : _currentPageViewIndex = currentPageViewIndex, super(key: key);

  final List<IconData> indicatorsIconsArray;
  final int _currentPageViewIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicatorsIconsArray
            .asMap()
            .entries
            .map((entry) => Icon(entry.value,
                size: 16,
                color: entry.key ==
                       _currentPageViewIndex
                    ? Colors.grey
                    : Color(0x55dddddd)))
            .toList()
        );
  }
}
