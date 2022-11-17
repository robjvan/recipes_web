import 'package:flutter/material.dart';

@immutable
class NavigationRow extends StatelessWidget {
  final String navRoute; // ie. "DasboardScreen.routeName"
  final IconData iconData; // ie. "Icons.home"
  final String label; // ie. "Dashboard"

  const NavigationRow({
    required this.navRoute,
    required this.iconData,
    required this.label,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: () => Navigator.pushNamed(
          context,
          navRoute,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: <Widget>[
              Icon(iconData),
              const SizedBox(width: 16),
              Text(label),
              const Spacer(),
            ],
          ),
        ),
      );
}
