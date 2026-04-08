import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'caregiver_add_medicine_screen.dart';

class CaregiverScheduleScreen extends StatelessWidget {
  const CaregiverScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: tealColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Schedule',
          style: GoogleFonts.inter(
            color: tealColor,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF2D3748)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  // Today / Weekly Toggle
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF2F7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Today',
                                style: GoogleFonts.inter(
                                  color: tealColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Weekly',
                              style: GoogleFonts.inter(
                                color: const Color(0xFF718096),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Missed Dose Detected Banner
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDE4E4), // Light orange/pink
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange.shade800, size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Missed Dose Detected',
                                style: GoogleFonts.inter(
                                  color: Colors.orange.shade900,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Missed: Metformin (500mg) at\n08:00 AM. Please verify if\nadministered or mark as\nskipped.',
                                style: GoogleFonts.inter(
                                  color: Colors.orange.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.close, color: Colors.orange.shade800, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Morning
                  _buildTimeSectionHeader(Icons.wb_sunny_outlined, 'Morning', const Color(0xFF80DEEA)),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimelineLine(),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildMedicationCard(
                          status: 'TAKEN',
                          statusColor: const Color(0xFFE8F5E9),
                          statusTextColor: tealColor,
                          statusIcon: Icons.check_circle,
                          name: 'Lisinopril',
                          details: '10mg • 07:30 AM',
                          actionIcon: Icons.link,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Afternoon
                  _buildTimeSectionHeader(Icons.light_mode_outlined, 'Afternoon', const Color(0xFFE2E8F0)),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimelineLine(),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildMedicationCard(
                          isCurrent: true,
                          status: 'UPCOMING',
                          statusColor: const Color(0xFFE0F7FA),
                          statusTextColor: tealColor,
                          name: 'Aspirin',
                          details: '81mg • 12:30\nPM',
                          buttonLabel: 'Mark Taken',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Night
                  _buildTimeSectionHeader(Icons.nightlight_round, 'Night', const Color(0xFFE2E8F0)),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimelineLine(isLast: true),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE2E8F0), style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today_outlined, color: Color(0xFFA0AEC0)),
                              const SizedBox(height: 8),
                              Text(
                                'No medications\nscheduled for tonight',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF718096),
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 100), // Spacing for FAB
                ],
              ),
            ),
          ),
          
          // FAB aligned similar to wireframe
          Positioned(
            bottom: 24,
            right: 24,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CaregiverAddMedicineScreen()),
                );
              },
              icon: const Icon(Icons.add, size: 20),
              label: const Text('Add Medicine'),
              style: ElevatedButton.styleFrom(
                backgroundColor: tealColor,
                foregroundColor: Colors.white,
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSectionHeader(IconData icon, String title, Color iconBgColor) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF4A5568), size: 16),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.inter(
            color: const Color(0xFF2D3748),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineLine({bool isLast = false}) {
    return Container(
      width: 2,
      height: 100,
      margin: const EdgeInsets.only(left: 15),
      color: isLast ? Colors.transparent : const Color(0xFFE2E8F0),
    );
  }

  Widget _buildMedicationCard({
    bool isCurrent = false,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    IconData? statusIcon,
    required String name,
    required String details,
    IconData? actionIcon,
    String? buttonLabel,
  }) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: isCurrent ? Border(left: BorderSide(color: tealColor, width: 4)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                status,
                style: GoogleFonts.inter(
                  color: statusTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              if (statusIcon != null) ...[
                const SizedBox(width: 4),
                Icon(statusIcon, size: 12, color: statusTextColor),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2D3748),
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              if (actionIcon != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE2E8F0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(actionIcon, size: 16, color: tealColor),
                ),
              if (buttonLabel != null)
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tealColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    minimumSize: const Size(0, 36),
                  ),
                  child: Text(
                    buttonLabel,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            details,
            style: GoogleFonts.inter(
              color: const Color(0xFF718096),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
