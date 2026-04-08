import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaregiverOverviewTab extends StatelessWidget {
  const CaregiverOverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);
    const lightCyan = Color(0xFFE0F7FA);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: lightCyan,
                        radius: 18,
                        child: const Icon(Icons.volunteer_activism, color: tealColor, size: 20),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'MediLink',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: tealColor,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none, color: Color(0xFF2D3748), size: 28),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 32,
                  height: 2,
                  color: Colors.pinkAccent.shade100,
                ),
              ),
              const SizedBox(height: 24),
              
              Text(
                'Good morning,\nSarah',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF2D3748),
                  height: 1.1,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Monday, Oct 24, 2023',
                style: GoogleFonts.inter(
                  color: const Color(0xFF9E9E9E),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),

              // Stat Cards
              _buildStatCard(
                icon: Icons.people_alt_rounded,
                iconColor: tealColor,
                iconBgColor: lightCyan,
                title: 'Total Patients',
                value: '08',
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                icon: Icons.check_circle_outline,
                iconColor: tealColor,
                iconBgColor: const Color(0xFFE8F5E9), // Light green
                title: 'Meds Given',
                value: '42',
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                icon: Icons.warning_amber_rounded,
                iconColor: Colors.red.shade700,
                iconBgColor: Colors.red.shade50,
                title: 'Missed Doses',
                value: '03',
              ),
              const SizedBox(height: 32),

              // Today's Schedule Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Today\'s\nSchedule',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2D3748),
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4F8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: tealColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'LIVE\nMONITORING',
                          style: GoogleFonts.inter(
                            color: tealColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Schedule List
              _buildScheduleCard(
                name: 'Arthur Jenkins',
                medication: 'Lisinopril 10mg',
                time: '08:30 AM',
                status: 'UPCOMING',
                statusColor: const Color(0xFF80DEEA), // Light cyan
                statusTextColor: tealColor,
                avatarUrl: 'https://i.pravatar.cc/150?img=11',
                isLeftBorderVisible: true,
                leftBorderColor: tealColor,
              ),
              const SizedBox(height: 12),
              _buildScheduleCard(
                name: 'Martha Stewart',
                medication: 'Metformin 500mg',
                time: '07:45 AM',
                status: 'TAKEN',
                statusColor: const Color(0xFFB2DFDB), // Light teal
                statusTextColor: tealColor,
                avatarUrl: 'https://i.pravatar.cc/150?img=5',
                isLeftBorderVisible: false,
                iconData: Icons.check,
              ),
              const SizedBox(height: 12),
              _buildScheduleCard(
                name: 'James Wilson',
                medication: 'Atorvastatin 20mg',
                time: '07:00 AM',
                status: 'MISSED',
                statusColor: Colors.red.shade300,
                statusTextColor: Colors.white,
                avatarUrl: 'https://i.pravatar.cc/150?img=12',
                isLeftBorderVisible: true,
                leftBorderColor: Colors.red.shade700,
                iconData: Icons.calendar_today_outlined,
                iconColor: Colors.red.shade700,
              ),
              const SizedBox(height: 12),
              _buildScheduleCard(
                name: 'Linda Gray',
                medication: 'Gabapentin 300mg',
                time: '10:15 AM',
                status: 'UPCOMING',
                statusColor: const Color(0xFFE2E8F0),
                statusTextColor: const Color(0xFF4A5568),
                avatarUrl: 'https://i.pravatar.cc/150?img=9',
                isLeftBorderVisible: false,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: const Color(0xFF718096),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.inter(
                  color: const Color(0xFF2D3748),
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  height: 1.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard({
    required String name,
    required String medication,
    required String time,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required String avatarUrl,
    bool isLeftBorderVisible = false,
    Color? leftBorderColor,
    IconData? iconData,
    Color? iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            border: isLeftBorderVisible && leftBorderColor != null
                ? Border(left: BorderSide(color: leftBorderColor, width: 4))
                : null,
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF2D3748),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      medication,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF718096),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(iconData ?? Icons.access_time, size: 14, color: iconColor ?? const Color(0xFF718096)),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: GoogleFonts.inter(
                            color: iconColor ?? const Color(0xFF718096),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.inter(
                    color: statusTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

