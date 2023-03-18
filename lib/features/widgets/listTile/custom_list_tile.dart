// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.avatarUrl,
    this.onTab,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final String? avatarUrl;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      visualDensity: const VisualDensity(vertical: -4),
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: title,
      subtitle: subtitle,
      leading: FittedBox(
        alignment: Alignment.centerLeft,
        child: leading,
      ),
      style: ListTileStyle.drawer,
      trailing: trailing,
    );
  }
}
