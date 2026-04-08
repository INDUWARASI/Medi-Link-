import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'dashboard_screen.dart';
import 'caregiver_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

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
                            Text(
                              'Caregiver Monitoring Active',
                              style: TextStyle(
                                color: Color(0xFF757575), // Colors.grey.shade600 equivalent
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
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
                              const Text(
                                'Welcome Back',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF2D3748),
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "We're here to help you stay healthy.",
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 32),
                              
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
                                ),
                              ),
                              const SizedBox(height: 24),
                              
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
                                ),
                              ),
                              const SizedBox(height: 32),
                              
                              // Login Button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CaregiverDashboardScreen()),
                                  );
                                },
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
                                      'Login to MediLink',
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
                              
                              // Forgot Password
                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                      color: tealColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 1)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'NEW HERE?',
                                      style: TextStyle(
                                        color: const Color(0xFFBDBDBD),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: Divider(color: Color(0xFFEEEEEE), thickness: 1)),
                                ],
                              ),
                              const SizedBox(height: 24),
                              
                              // Create Account Button
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: tealColor,
                                  side: const BorderSide(color: Color(0xFFE0E0E0), width: 1.5),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                          'Trusted by thousands of caregivers and family\nmembers worldwide.',
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
