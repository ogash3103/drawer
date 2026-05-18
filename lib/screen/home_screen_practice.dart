import 'package:flutter/material.dart';

class HomeScreenPractice extends StatelessWidget {
  const HomeScreenPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: Column(
          children: [
            // 1. User Info Header
            _buildHeader(context),

            // 2. Navigation Items
            Expanded(
              child: _buildNavItems(context),
            ),
            //
            // // 3. Bottom Actions (Logout)
            _buildBottomSection(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return UserAccountsDrawerHeader(
    accountName: Text("Ogabek", style: TextStyle(fontWeight: FontWeight.bold)),
    accountEmail: Text('ogash@gmail.com'),
     currentAccountPicture: CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(
        "https://i.pravatar.cc/300",
      ),
    ),
    /*currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(
        'J',
        style: TextStyle(fontSize: 32, color: Theme
            .of(context)
            .primaryColor),
      ),
    ),*/

    decoration: BoxDecoration(color: Theme
        .of(context)
        .primaryColor),
    // Ikkinchi avatar (multi-account)
    otherAccountsPictures: const [CircleAvatar(child: Text('A'))],
  );
}

Widget _buildNavItems(BuildContext context) {
  final items = [
    _NavItem(icon: Icons.home_outlined, label: 'Home', route: '/home'),
    _NavItem(icon: Icons.person_outline, label: 'Profile', route: '/profile'),
    _NavItem(icon: Icons.bar_chart, label: 'Statistics', route: '/stats'),
    _NavItem(
      icon: Icons.settings_outlined,
      label: 'Settings',
      route: '/settings',
    ),
  ];
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: items.length,
    itemBuilder: (context, inx) {
      final item = items[inx];
      final isSelected = ModalRoute
          .of(context)
          ?.settings
          .name == item.route;
      return ListTile(
        leading: Icon(item.icon, color: isSelected ? Theme
            .of(context)
            .primaryColor : null,),
        title: Text(item.label),
        selected: isSelected,
        selectedTileColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          Navigator.pop(context);
          if(!isSelected) {
            Navigator.pushNamed(context, item.route);
          }
        },
      );
    },
  );
}


Widget _buildBottomSection(BuildContext context) {
  return Column(
    children: [
      const Divider(),
      ListTile(
        leading: Icon(Icons.logout, color: Colors.red,),
        title: Text('Logout', style: TextStyle(color: Colors.red,),),
        onTap: () => _showLogoutDialog(context),
      ),
      const SizedBox(height: 8),
    ],
  );
}

void _showLogoutDialog(BuildContext context) {
  showDialog(context: context,
      builder: (_) => AlertDialog(
        title: Text("Logout"),
        content: Text("Haqiqatdan chiqmoqchimisiz?"),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          },
              child: Text("Bekor qilish"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              // Auth logout logic...
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Chiqish'),
          ),
        ],
      ),
  );
}

// Helper model
class _NavItem {
  final IconData icon;
  final String label;
  final String route;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}
