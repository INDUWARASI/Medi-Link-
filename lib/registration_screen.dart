import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _userType = 'patient';
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF006B70);
    const lightCyan = Color(0xFFE0F7FA);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.4, 1.0],
            colors: [
              lightCyan.withOpacity(0.8),
              Colors.white,
              lightCyan.withOpacity(0.3),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 40),
                        // Logo Section
                        Center(
                          child: Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              color: Color(0xFFB2EBF2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.volunteer_activism,
                              color: tealColor,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text(
                            'MediLink',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1E1E1E),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: tealColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'MONITORING ACTIVE',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Main Card
                        Container(
                          padding: const EdgeInsets.all(28.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 24,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Center(
                                child: Text(
                                  'Join MediLink',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF2D3748),
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Center(
                                child: Text(
                                  "Start your wellness journey with us.",
                                  style: TextStyle(
                                    color: Color(0xFF757575),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Full Name Field
                              const Text(
                                'Full Name',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF616161),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontWeight: FontWeight.w400),
                                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF9E9E9E)),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: tealColor, width: 1.5),
                                  ),
                                  fillColor: const Color(0xFFF5F5F5),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Email Field
                              const Text(
                                'Email Address',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF616161),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'name@example.com',
                                  hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontWeight: FontWeight.w400),
                                  prefixIcon: const Icon(Icons.mail_outline, color: Color(0xFF9E9E9E)),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: tealColor, width: 1.5),
                                  ),
                                  fillColor: const Color(0xFFF5F5F5),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Password Field
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF616161),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                obscureText: _obscurePassword,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: '••••••••',
                                  hintStyle: const TextStyle(color: Color(0xFFBDBDBD), letterSpacing: 2),
                                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF9E9E9E)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: const Color(0xFF9E9E9E),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: tealColor, width: 1.5),
                                  ),
                                  fillColor: const Color(0xFFF5F5F5),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Confirm Password Field
                              const Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF616161),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                obscureText: _obscureConfirmPassword,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: '••••••••',
                                  hintStyle: const TextStyle(color: Color(0xFFBDBDBD), letterSpacing: 2),
                                  prefixIcon: const Icon(Icons.restore, color: Color(0xFF9E9E9E)),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: const Color(0xFF9E9E9E),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword = !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Color(0xFFEEEEEE)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: tealColor, width: 1.5),
                                  ),
                                  fillColor: const Color(0xFFF5F5F5),
                                  filled: true,
                                ),
                              ),
                              const SizedBox(height: 24),

                              // User Type Selection
                              const Text(
                                'I am a...',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF616161),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => setState(() => _userType = 'patient'),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        decoration: BoxDecoration(
                                          color: _userType == 'patient' ? const Color(0xFFE8F5F5) : const Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                            color: _userType == 'patient' ? tealColor : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.elderly,
                                              color: _userType == 'patient' ? tealColor : const Color(0xFF757575),
                                              size: 28,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Patient',
                                              style: TextStyle(
                                                color: _userType == 'patient' ? Colors.black87 : const Color(0xFF757575),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => setState(() => _userType = 'caregiver'),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        decoration: BoxDecoration(
                                          color: _userType == 'caregiver' ? const Color(0xFFE8F5F5) : const Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                            color: _userType == 'caregiver' ? tealColor : Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.volunteer_activism,
                                              color: _userType == 'caregiver' ? tealColor : const Color(0xFF757575),
                                              size: 28,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Caregiver',
                                              style: TextStyle(
                                                color: _userType == 'caregiver' ? Colors.black87 : const Color(0xFF757575),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Terms Checkbox
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: _agreedToTerms,
                                      onChanged: (value) {
                                        setState(() {
                                          _agreedToTerms = value ?? false;
                                        });
                                      },
                                      activeColor: tealColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12), // Makes it circular like in image
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _agreedToTerms = !_agreedToTerms;
                                        });
                                      },
                                      child: RichText(
                                        text: TextSpan(
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF616161),
                                            fontSize: 13,
                                            height: 1.4,
                                          ),
                                          children: const [
                                            TextSpan(text: 'I agree to the '),
                                            TextSpan(
                                              text: 'Terms of Service',
                                              style: TextStyle(
                                                color: tealColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            TextSpan(text: ' and\n'),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: tealColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Create Account Button
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tealColor,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Create Account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward, size: 20),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Login Link
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF616161),
                                          fontSize: 14,
                                        ),
                                        children: const [
                                          TextSpan(text: 'Already have an account? '),
                                          TextSpan(
                                            text: 'Login',
                                            style: TextStyle(
                                              color: tealColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Bottom Avatars
                        Center(
                          child: SizedBox(
                            width: 110,
                            height: 48,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFFFFCCBC),
                                      child: Icon(Icons.person, color: Colors.white, size: 20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 28,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFF90CAF9),
                                      child: Icon(Icons.person_outline, color: Colors.white, size: 20),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 56,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 2),
                                    ),
                                    child: const CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Color(0xFF80DEEA),
                                      child: Text(
                                        '+12k',
                                        style: TextStyle(
                                          color: tealColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Trusted by caregivers and family members\nworldwide.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF9E9E9E),
                            fontSize: 11,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
