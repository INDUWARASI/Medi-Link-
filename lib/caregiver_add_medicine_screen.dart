import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaregiverAddMedicineScreen extends StatelessWidget {
  const CaregiverAddMedicineScreen({super.key});

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
          'Add New Medicine',
          style: GoogleFonts.inter(
            color: tealColor,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFF2D3748),
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Banner
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1584308666744-24d5e4a500a6?q=80&w=600&auto=format&fit=crop'),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Care for your health, one dose at a\ntime.',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Medicine Details Section
            Container(
              padding: const EdgeInsets.all(24),
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
                  Text(
                    'Medicine Details',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Provide the core information about the\nprescription.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF718096),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  Text(
                    'Medicine Name',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTextField(hint: 'e.g. Metformin', icon: Icons.medication),
                  const SizedBox(height: 16),
                  
                  Text(
                    'Dosage',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildTextField(hint: 'e.g. 500mg', icon: Icons.science),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Schedule & Timing Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFEDF2F7), // Light grey
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule & Timing',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'When and how often should this be\ntaken?',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF718096),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Reminder Times
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Color(0xFF4A5568)),
                      const SizedBox(width: 8),
                      Text(
                        'Reminder Times',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildTimePill('08:00 AM', isSelected: true),
                      const SizedBox(width: 8),
                      _buildTimePill('02:00 PM'),
                      const SizedBox(width: 8),
                      _buildTimePill('08:00 PM'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF80DEEA),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: tealColor, size: 16),
                  ),
                  const SizedBox(height: 24),

                  // Frequency
                  Row(
                    children: [
                      const Icon(Icons.repeat, size: 14, color: Color(0xFF4A5568)),
                      const SizedBox(width: 8),
                      Text(
                        'Frequency',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildFrequencyOption('Daily', isSelected: true)),
                      Expanded(child: _buildFrequencyOption('Every other day')),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildFrequencyOption('Weekly')),
                      Expanded(child: _buildFrequencyOption('As needed')),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Color(0xFF4A5568)),
                      const SizedBox(width: 8),
                      Text(
                        'Duration',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildDateCard('START DATE', 'Oct 12, 2023'),
                  const SizedBox(height: 8),
                  _buildDateCard('END DATE', 'Ongoing'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Did you know info box
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF80DEEA),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.info_outline, color: tealColor, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Did you know?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF2D3748),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Taking Metformin with meals can help\nreduce stomach-related side effects\nfor most users.',
                          style: GoogleFonts.inter(
                            color: const Color(0xFF718096),
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: tealColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Save Medicine',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon}) {
    const tealColor = Color(0xFF006B70);
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: const Color(0xFFA0AEC0)),
        prefixIcon: Icon(icon, color: tealColor, size: 20),
        filled: true,
        fillColor: const Color(0xFFEDF2F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildTimePill(String time, {bool isSelected = false}) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? tealColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        time,
        style: GoogleFonts.inter(
          color: isSelected ? Colors.white : const Color(0xFF4A5568),
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildFrequencyOption(String title, {bool isSelected = false}) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? tealColor : const Color(0xFFE2E8F0),
        border: Border.all(
          color: isSelected ? tealColor : const Color(0xFFE2E8F0),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : const Color(0xFF4A5568),
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDateCard(String label, String date) {
    const tealColor = Color(0xFF006B70);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: const Color(0xFFA0AEC0),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: GoogleFonts.inter(
                  color: const Color(0xFF2D3748),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Icon(Icons.calendar_today_outlined, color: tealColor, size: 20),
        ],
      ),
    );
  }
}
