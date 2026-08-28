import 'package:flutter/material.dart';

class CreateIdentityPage extends StatelessWidget {
  const CreateIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF172A3A),

      appBar: AppBar(
        backgroundColor: const Color(0xFF172A3A),
        foregroundColor: const Color(0xFFF4F7F9),
        elevation: 0,
        title: const Text(
          'إنشاء هوية رقمية',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

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
                  'إنشاء هوية رقمية',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF4F7F9),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'أنشئ هويتك الرقمية بطريقة آمنة',
                  textAlign: TextAlign.center,
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
                        'بيانات الهوية',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF4F7F9),
                        ),
                      ),

                      const SizedBox(height: 22),

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
                        style: const TextStyle(
                          color: Color(0xFFF4F7F9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'اسم المستخدم',
                          labelStyle: const TextStyle(
                            color: Color(0xFFB8C7D1),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_outline,
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
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          color: Color(0xFFF4F7F9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'رقم الجوال',
                          labelStyle: const TextStyle(
                            color: Color(0xFFB8C7D1),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_outlined,
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

                      const SizedBox(height: 15),

                      TextField(
                        obscureText: true,
                        style: const TextStyle(
                          color: Color(0xFFF4F7F9),
                        ),
                        decoration: InputDecoration(
                          labelText: 'تأكيد رمز الدخول',
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

                      const SizedBox(height: 25),

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
                            'متابعة',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'العودة إلى تسجيل الدخول',
                    style: TextStyle(
                      color: Color(0xFF3AAFA9),
                      fontSize: 15,
                    ),
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