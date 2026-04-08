import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'caregiver_schedule_screen.dart';

class CaregiverPatientsTab extends StatelessWidget {
  const CaregiverPatientsTab({super.key});

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);

    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
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
                          const CircleAvatar(
                            backgroundColor: tealColor,
                            radius: 20,
                            child: Icon(Icons.person, color: Colors.white, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back,',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xFF4A5568),
                                ),
                              ),
                              Text(
                                'MediLink',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: tealColor,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF0F4F8),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.search, color: tealColor, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 32,
                      height: 2,
                      color: Colors.pinkAccent.shade100,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'My Patients',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF2D3748),
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Showing 6 assigned individuals under your care.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF718096),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Filter Chips
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('All Patients', true),
                        const SizedBox(width: 8),
                        _buildFilterChip('High Priority', false),
                        const SizedBox(width: 8),
                        _buildFilterChip('Stable', false),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Patient Cards
                  _buildPatientCard(
                    context: context,
                    name: 'Arthur Miller',
                    statusTag: 'ATTENTION',
                    statusBgColor: Colors.red.shade50,
                    statusTextColor: Colors.red.shade700,
                    details: '1 missed dose • Med: Lisinopril',
                    avatarUrl: 'https://i.pravatar.cc/150?img=11',
                    dotColor: Colors.red.shade700,
                  ),
                  const SizedBox(height: 16),
                  _buildPatientCard(
                    context: context,
                    name: 'Eleanor Rigby',
                    statusTag: 'ALL CLEAR',
                    statusBgColor: const Color(0xFFE0F2F1),
                    statusTextColor: tealColor,
                    details: 'All clear today • Next dose: 4:00 PM',
                    avatarUrl: 'https://i.pravatar.cc/150?img=5',
                    dotColor: tealColor,
                  ),
                  const SizedBox(height: 16),
                  _buildPatientCard(
                    context: context,
                    name: 'Samuel Brooks',
                    statusTag: 'ALL CLEAR',
                    statusBgColor: const Color(0xFFE0F2F1),
                    statusTextColor: tealColor,
                    details: 'Evening checkup pending • Stable',
                    avatarUrl: 'https://i.pravatar.cc/150?img=12',
                    dotColor: tealColor,
                  ),
                  
                  const SizedBox(height: 100), // Space for bottom banner
                ],
              ),
            ),
          ),

          // Live Monitoring Banner
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFC),
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
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: tealColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Live Monitoring\nActive',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF4A5568),
                      height: 1.2,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'LAST SYNC: 2M\nAGO',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFA0AEC0),
                      letterSpacing: 0.5,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? tealColor : const Color(0xFFEDF2F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: isSelected ? Colors.white : const Color(0xFF4A5568),
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPatientCard({
    required BuildContext context,
    required String name,
    required String statusTag,
    required Color statusBgColor,
    required Color statusTextColor,
    required String details,
    required String avatarUrl,
    required Color dotColor,
  }) {
    const tealColor = Color(0xFF006B70);
    
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: GoogleFonts.inter(
                              color: const Color(0xFF2D3748),
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            statusTag,
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
                    const SizedBox(height: 8),
                    Text(
                      details,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF718096),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CaregiverScheduleScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.calendar_today_outlined, size: 16),
                  label: const Text('View Schedule'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tealColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: tealColor,
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Icon(Icons.phone_outlined, size: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
