import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class CaregiverSettingsTab extends StatefulWidget {
  const CaregiverSettingsTab({super.key});

  @override
  State<CaregiverSettingsTab> createState() => _CaregiverSettingsTabState();
}

class _CaregiverSettingsTabState extends State<CaregiverSettingsTab> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // Header
              Row(
                children: [
                  const Icon(Icons.arrow_back, color: tealColor),
                  const SizedBox(width: 16),
                  Text(
                    'Profile & Settings',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: tealColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Profile Section
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=13'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: tealColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Nimal Perera',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'nimal.perera@example.com',
                style: GoogleFonts.inter(
                  color: const Color(0xFF718096),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),

              // Account Settings Header
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Account Settings',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF4A5568),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Settings List
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F8).withOpacity(0.5), // Very light grey background behind cards if needed, but the cards themselves are white
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Icons.person_outline,
                      iconBgColor: const Color(0xFF80DEEA), // Light cyan
                      iconColor: tealColor,
                      title: 'Personal Information',
                      subtitle: 'Manage your profile details',
                      trailing: const Icon(Icons.chevron_right, color: Color(0xFFA0AEC0)),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingItem(
                      icon: Icons.notifications_none,
                      iconBgColor: const Color(0xFFA7F3D0), // Light green
                      iconColor: tealColor,
                      title: 'Notifications',
                      subtitle: 'Reminders and care alerts',
                      trailing: Switch(
                        value: _notificationsEnabled,
                        onChanged: (val) {
                          setState(() {
                            _notificationsEnabled = val;
                          });
                        },
                        activeColor: Colors.white,
                        activeTrackColor: tealColor,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingItem(
                      icon: Icons.language,
                      iconBgColor: const Color(0xFFE2E8F0), // Light grey
                      iconColor: const Color(0xFF4A5568), // Dark grey
                      title: 'Language',
                      subtitle: 'Select your preferred language',
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'English',
                            style: GoogleFonts.inter(
                              color: tealColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, color: Color(0xFFA0AEC0)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSettingItem(
                      icon: Icons.help_outline,
                      iconBgColor: const Color(0xFFFBD38D), // Light orange
                      iconColor: Colors.deepOrange.shade700,
                      title: 'Help & Support',
                      subtitle: 'FAQs and contact us',
                      trailing: const Icon(Icons.chevron_right, color: Color(0xFFA0AEC0)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B6B), // Red/Salmon
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Footer Text
              Text(
                'MediLink v2.4.1 — Care for Generations',
                style: GoogleFonts.inter(
                  color: const Color(0xFFA0AEC0),
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2D3748),
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF718096),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
