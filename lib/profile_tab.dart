import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'personal_info_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            // Avatar Section
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage('https://i.pravatar.cc/150?img=11'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: tealColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nimal Perera',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF2D3748),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'nimal.perera@example.com',
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 32),

            // Account Settings
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Account Settings',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingItem(
                    title: 'Personal Information',
                    subtitle: 'Manage your profile details',
                    iconData: Icons.person_outline,
                    iconBg: const Color(0xFFB2EBF2),
                    iconColor: tealColor,
                    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
                      );
                    },
                  ),
                  Divider(height: 1, color: Colors.grey.shade200, indent: 70, endIndent: 20),
                  _buildSettingItem(
                    title: 'Notifications',
                    subtitle: 'Reminders and care alerts',
                    iconData: Icons.notifications_none,
                    iconBg: const Color(0xFFB2DFDB),
                    iconColor: tealColor,
                    trailing: Switch(
                      value: true,
                      onChanged: (val) {},
                      activeColor: Colors.white,
                      activeTrackColor: tealColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey.shade200, indent: 70, endIndent: 20),
                  _buildSettingItem(
                    title: 'Language',
                    subtitle: 'Select your preferred language',
                    iconData: Icons.language,
                    iconBg: const Color(0xFFE0E0E0),
                    iconColor: Colors.black54,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'English',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: tealColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.expand_more, color: Colors.grey, size: 16),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey.shade200, indent: 70, endIndent: 20),
                  _buildSettingItem(
                    title: 'Help & Support',
                    subtitle: 'FAQs and contact us',
                    iconData: Icons.help_outline,
                    iconBg: const Color(0xFFFFCCBC),
                    iconColor: const Color(0xFFD84315),
                    trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B6B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 20, color: Color(0xFF8B0000)),
                label: Text(
                  'Logout',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF8B0000),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Footer Version
            Text(
              'MediLink v2.4.1 — Care for Generations',
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required IconData iconData,
    required Color iconBg,
    required Color iconColor,
    required Widget trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    ),
    );
  }
}
