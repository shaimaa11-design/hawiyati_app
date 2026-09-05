import 'package:flutter/material.dart';

class FaceVerificationPage extends StatelessWidget {
  const FaceVerificationPage({super.key});

  // ألوان تطبيق هويتي
  static const darkBrown = Color(0xFF4E342E);
  static const lightBrown = Color(0xFFD7CCC8);
  static const whiteText = Color(0xFFFAF9F6);
  static const secondaryText = Color(0xFFE0D6D2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBrown,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
          child: Column(
            children: [

              // =========================
              // العنوان
              // =========================
              const Text(
                'هويتي',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: whiteText,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'هويتك الرقمية في مكان واحد',
                style: TextStyle(
                  fontSize: 15,
                  color: secondaryText,
                ),
              ),

              const SizedBox(height: 28),

              // =========================
              // عنوان التحقق
              // =========================
              const Text(
                'التحقق من الوجه',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: whiteText,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'ضع وجهك داخل الإطار لإتمام عملية التحقق',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: secondaryText,
                ),
              ),

              const SizedBox(height: 25),

              // =========================
              // بطاقة الكاميرا
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: lightBrown,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [

                    // إطار الوجه
                    Container(
                      width: 250,
                      height: 310,
                      decoration: BoxDecoration(
                        color: darkBrown,
                        borderRadius: BorderRadius.circular(125),
                        border: Border.all(
                          color: whiteText,
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.face_outlined,
                          size: 125,
                          color: lightBrown,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // رسالة الكاميرا
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: whiteText,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: darkBrown,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              'ضع وجهك داخل الإطار وانظر مباشرة إلى الكاميرا',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: darkBrown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // =========================
              // تعليمات مهمة
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: lightBrown,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [

                    const Text(
                      'تعليمات مهمة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: darkBrown,
                      ),
                    ),

                    const SizedBox(height: 18),

                    _instruction(
                      icon: Icons.person_outline,
                      text: 'تأكد من أن وجهك واضح أمام الكاميرا',
                    ),

                    const SizedBox(height: 12),

                    _instruction(
                      icon: Icons.light_mode_outlined,
                      text: 'تأكد من وجود إضاءة كافية على وجهك',
                    ),

                    const SizedBox(height: 12),

                    _instruction(
                      icon: Icons.visibility_outlined,
                      text: 'انظر مباشرة إلى الكاميرا',
                    ),

                    const SizedBox(height: 12),

                    _instruction(
                      icon: Icons.accessibility_new_outlined,
                      text: 'حافظ على ثبات رأسك ووجهك داخل الإطار',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // =========================
              // زر بدء التحقق
              // =========================
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // هنا يتم ربط الكاميرا و Liveness Detection لاحقًا
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: darkBrown,
                    size: 25,
                  ),
                  label: const Text(
                    'بدء التحقق',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: darkBrown,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFFE0D6D2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // =========================
              // ملاحظة الخصوصية
              // =========================
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    color: secondaryText,
                    size: 18,
                  ),
                  SizedBox(width: 7),
                  Flexible(
                    child: Text(
                      'بياناتك محمية بتقنيات التشفير ولا تتم مشاركتها دون موافقتك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: secondaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =========================
  // عنصر التعليمات
  // =========================
  static Widget _instruction({
    required IconData icon,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: darkBrown,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: whiteText,
            size: 22,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: darkBrown,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}