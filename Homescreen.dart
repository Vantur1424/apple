import 'package:flutter/material.dart';
import 'package:m09/beranda.dart';
import 'package:m09/pengaturan.dart';
import 'package:m09/profile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedDrawerIndex = 0;

  final List<Widget> _pages = [BerandaPage(), ProfilPage(), PengaturanPage()];

  void _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("m09")),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white),
                  SizedBox(height: 10),
                  Text("Nama Anggota", style: TextStyle(color: Colors.white)),
                  Text("Email", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Colors.red),
              title: Text('Beranda'),
              onTap: () => _onSelectItem(0),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () => _onSelectItem(1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () => _onSelectItem(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedDrawerIndex],
    );
  }
}
