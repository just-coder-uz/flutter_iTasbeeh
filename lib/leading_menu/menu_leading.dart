import 'package:flutter/material.dart';

class LeadingMenu extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  LeadingMenu({super.key});
  final _padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: Material(
        color: const Color.fromARGB(255, 253, 231, 210),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ListView(
            padding: _padding,
            children: <Widget>[
              const SizedBox(height: 48),
              buildMenuIteam(
                text: 'My Account',
                icon: (Icons.account_circle_outlined),
              ),
              const SizedBox(height: 16),
              buildMenuIteam(
                text: 'Privacy',
                icon: (Icons.lock_outline_rounded),
              ),
              const SizedBox(height: 16),
              buildMenuIteam(
                text: 'Settings',
                icon: (Icons.settings_outlined),
              ),
              const SizedBox(height: 24),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 24,
              ),
              buildMenuIteam(
                text: 'Info',
                icon: (Icons.info_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuIteam({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color.fromRGBO(180, 136, 17, 25);
    const hoverColor = Color.fromRGBO(180, 136, 17, 25);
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }
}
