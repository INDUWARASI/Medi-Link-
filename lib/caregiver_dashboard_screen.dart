import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'caregiver_overview_tab.dart';
import 'caregiver_patients_tab.dart';
import 'caregiver_alerts_tab.dart';
import 'caregiver_settings_tab.dart';

class CaregiverDashboardScreen extends StatefulWidget {
  const CaregiverDashboardScreen({super.key});

  @override
  State<CaregiverDashboardScreen> createState() => _CaregiverDashboardScreenState();
}

class _CaregiverDashboardScreenState extends State<CaregiverDashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const CaregiverOverviewTab(),
    const CaregiverPatientsTab(),
    const CaregiverAlertsTab(),
    const CaregiverSettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      body: _tabs[_selectedIndex],
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
        selectedLabelStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 11),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
