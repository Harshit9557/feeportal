import 'package:feeportal/app/constants/color_constants.dart';
import 'package:feeportal/view/navbar/navigation_screen/normal_layout.dart';
import 'package:flutter/material.dart';

typedef OnNavigationItemSelected = Function(int index);

class SideNavigationItem {
  final IconData icon;
  final String title;
  bool selected;
  SideNavigationItem(
      {required this.icon, required this.title, this.selected = false});
}

class SideNavigationItemWidget extends StatefulWidget {
  final SideNavigationItem item;
  const SideNavigationItemWidget({Key? key, required this.item})
      : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SideNavigationItemWidgetState createState() =>
      _SideNavigationItemWidgetState();
}

class _SideNavigationItemWidgetState extends State<SideNavigationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.item.selected
            ? Border(
                left: BorderSide(
                  color: Colors.grey.shade700,
                  width: 3.0,
                ),
              )
            : const Border(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.item.icon,
              size: 28,
              color: widget.item.selected ? Colors.white : Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.item.selected ? Colors.white : Colors.grey,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SideNavigation extends StatefulWidget {
  final List<SideNavigationItem> navItems;
  final OnNavigationItemSelected itemSelected;
  final int initialIndex;
  final List<Widget> actions;
  const SideNavigation({
    Key? key,
    required this.navItems,
    required this.itemSelected,
    required this.initialIndex,
    required this.actions,
  });
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _SideNavigationState createState() => _SideNavigationState(
        navItems: this.navItems,
        initializeIndex: this.initialIndex,
        actions: this.actions,
      );
}

class _SideNavigationState extends State<SideNavigation> {
  final List<SideNavigationItem> navItems;
  final List<Widget> actions;
  final int initializeIndex;
  var currentIndex;

  _SideNavigationState({
    Key? key,
    required this.navItems,
    required this.initializeIndex,
    required this.actions,
  });

  @override
  void initState() {
    super.initState();
    if (navItems.length > 0 && initializeIndex <= navItems.length) {
      navItems[initializeIndex].selected = true;
      currentIndex = initializeIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kSplashScreenColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6.0,
          ),
        ],
      ),
      width: 72,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: kSplashScreenColor.withOpacity(0.3),
                height: 1.0,
              );
            },
            itemBuilder: (context, index) {
              var item = navItems[index];
              return GestureDetector(
                child: SideNavigationItemWidget(
                  item: item,
                ),
                onTap: () {
                  setState(() {
                    for (var item in navItems) {
                      item.selected = false;
                    }
                    item.selected = true;
                    selectedIndex = index;
                  });
                  if (index != currentIndex) {
                    widget.itemSelected(index);
                    currentIndex = index;
                  }
                },
              );
            },
            itemCount: navItems.length,
            shrinkWrap: true,
            primary: false,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: actions.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return actions[index];
              },
            ),
          )
        ],
      ),
    );
  }
}
