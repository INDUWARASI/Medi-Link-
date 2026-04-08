import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_tab.dart';
import 'schedule_tab.dart';
import 'reports_tab.dart';
import 'profile_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const ScheduleTab(),
    const ReportsTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: _buildAppBar(tealColor),
      body: _tabs[_selectedIndex],
      floatingActionButton: _selectedIndex == 1 
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10, 
                    height: 10, 
                    decoration: const BoxDecoration(
                      color: tealColor, 
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Caregiver Monitoring', 
                    style: GoogleFonts.inter(
                      fontSize: 12, 
                      fontWeight: FontWeight.bold, 
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                ],
              ),
            ) 
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: tealColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(Color tealColor) {
    if (_selectedIndex == 1) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: tealColor),
          onPressed: () {},
        ),
        title: Text(
          'My Schedule',
          style: GoogleFonts.inter(
            color: tealColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ),
        ],
      );
    } else if (_selectedIndex == 2) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: tealColor),
          onPressed: () {},
        ),
        title: Text(
          'Health Report',
          style: GoogleFonts.inter(
            color: const Color(0xFF2D3748),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: tealColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.download, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      'Export',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else if (_selectedIndex == 3) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: tealColor),
          onPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        title: Text(
          'Profile & Settings',
          style: GoogleFonts.inter(
            color: tealColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      );
    } else {
      // Default / Home
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ),
        ),
        title: Text(
          'MediLink',
          style: GoogleFonts.inter(
            color: tealColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.notifications_none, color: tealColor, size: 28),
                Positioned(
                  right: 2,
                  top: 14,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
