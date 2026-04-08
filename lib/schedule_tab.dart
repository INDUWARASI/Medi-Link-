import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reminder_screen.dart';

class ScheduleTab extends StatelessWidget {
  const ScheduleTab({super.key});

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Month Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'October 2023',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                Text(
                  'Today',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: tealColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateBox('MON', '23', false, tealColor),
                _buildDateBox('TUE', '24', true, tealColor),
                _buildDateBox('WED', '25', false, tealColor),
                _buildDateBox('THU', '26', false, tealColor),
                _buildDateBox('FRI', '27', false, tealColor),
              ],
            ),
            const SizedBox(height: 24),

            // Morning Section
            Row(
              children: [
                const Icon(Icons.wb_sunny_outlined, color: tealColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Morning',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '07:00 AM - 11:00 AM',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMedicationCard(
              title: 'Lisinopril 10mg',
              subtitle: '07:30 AM • 1 Capsule',
              iconData: Icons.medication_liquid,
              iconBgColor: const Color(0xFFE0F2F1),
              iconColor: tealColor,
              badgeText: 'TAKEN',
              badgeColor: const Color(0xFFE0F2F1),
              badgeTextColor: tealColor,
              badgeIcon: Icons.check_circle,
              isMainAction: false,
            ),
            const SizedBox(height: 12),
            _buildMedicationCard(
              title: 'Multivitamin',
              subtitle: '09:00 AM • 1 Tablet',
              iconData: Icons.medical_services_outlined,
              iconBgColor: const Color(0xFFFFEBEE),
              iconColor: const Color(0xFFD32F2F),
              badgeText: 'MISSED',
              badgeColor: const Color(0xFFFFEBEE),
              badgeTextColor: const Color(0xFFD32F2F),
              badgeIcon: Icons.error,
              isMainAction: false,
            ),
            const SizedBox(height: 24),

            // Afternoon Section
            Row(
              children: [
                // Light ray sun icon
                const Icon(Icons.light_mode_outlined, color: tealColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Afternoon',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '12:00 PM - 04:00 PM',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMedicationCard(
              title: 'Metformin 500mg',
              subtitle: '12:45 PM • 1 Tablet',
              iconData: Icons.medication,
              iconBgColor: const Color(0xFFE0F7FA),
              iconColor: tealColor,
              badgeText: 'UPCOMING',
              badgeColor: const Color(0xFFE0F7FA),
              badgeTextColor: tealColor,
              badgeIcon: Icons.access_time,
              isMainAction: true,
              cardBorderColor: const Color(0xFF80DEEA),
              onMainActionPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReminderScreen()),
                );
              },
            ),
            const SizedBox(height: 24),

            // Night Section
            Row(
              children: [
                const Icon(Icons.dark_mode_outlined, color: const Color(0xFF2D3748), size: 20),
                const SizedBox(width: 8),
                Text(
                  'Night',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '06:00 PM - 10:00 PM',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Empty State Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey.shade300, // Used as placeholder for dashed
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.nightlight_outlined, color: Color(0xFF616161), size: 24),
                  const SizedBox(height: 12),
                  Text(
                    'No medications scheduled for tonight',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF616161),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90), // Spacer for Caregiver Monitoring bubble
          ],
        ),
      ),
    );
  }

  Widget _buildDateBox(String day, String date, bool isSelected, Color tealColor) {
    return Container(
      width: 56,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? tealColor : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(30),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: tealColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Column(
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white70 : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : const Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationCard({
    required String title,
    required String subtitle,
    required IconData iconData,
    required Color iconBgColor,
    required Color iconColor,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required IconData badgeIcon,
    required bool isMainAction,
    VoidCallback? onMainActionPressed,
    Color? cardBorderColor,
  }) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: cardBorderColor != null 
            ? Border.all(color: cardBorderColor, width: 1.5) 
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(badgeIcon, color: badgeTextColor, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      badgeText,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: badgeTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isMainAction) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onMainActionPressed ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: tealColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Mark as Taken',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
