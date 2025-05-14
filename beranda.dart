import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final theme = Theme.of(context);
        return Wrap(
          children: [
            ListTile(
              tileColor: theme.colorScheme.primary,
              title: Text(
                'Pilih Sosial Media',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            ListTile(
              leading: Icon(Icons.facebook),
              title: Text('Facebook'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Facebook diklik')));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Twitter'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Twitter diklik')));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "Info"),
              Tab(text: "Kontak"),
              Tab(text: "Lainnya"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("Ini adalah tab Info")),
                Center(child: Text("Ini adalah tab Kontak")),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _showBottomSheet(context),
                    child: Text("Buka Bottom Sheet"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
