import 'package:flutter/material.dart';
import 'create_identity.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172A3A),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo11.png',
                  width: 120,
                  height: 120,
                ),

                const SizedBox(height: 15),

                const Text(
                  'مرحبًا بك في هويتي',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4F7F9),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'هويتك الرقمية في مكان واحد',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFB8C7D1),
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  width: 350,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF29465B),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4F7F9),
                        ),
                      ),

                      const SizedBox(height: 25),

                      TextField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFFF4F7F9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'رقم الهوية',
                          labelStyle: const TextStyle(
                            color: Color(0xFFB8C7D1),
                          ),
                          prefixIcon: const Icon(
                            Icons.badge_outlined,
                            color: Color(0xFFB8C7D1),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF3A5A70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      TextField(
                        obscureText: true,
                        style: const TextStyle(
                          color: Color(0xFFF4F7F9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'رمز الدخول',
                          labelStyle: const TextStyle(
                            color: Color(0xFFB8C7D1),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFB8C7D1),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF3A5A70),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'نسيت رمز الدخول؟',
                            style: TextStyle(
                              color: Color(0xFF3AAFA9),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3AAFA9),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: const Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color(0xFF557184),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'أو',
                              style: TextStyle(
                                color: Color(0xFFB8C7D1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color(0xFF557184),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'ليس لديك هوية رقمية؟',
                        style: TextStyle(
                          color: Color(0xFFB8C7D1),
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 5),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreateIdentityPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'إنشاء هوية رقمية جديدة',
                          style: TextStyle(
                            color: Color(0xFF3AAFA9),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}