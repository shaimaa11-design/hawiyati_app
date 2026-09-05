import 'package:flutter/material.dart';

void main() {
  runApp(const DigitalIdentityApp());
}

class DigitalIdentityApp extends StatelessWidget {
  const DigitalIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الهوية الرقمية',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087F73),
        ),
      ),
      home: const IdentitySuccessPage(),
    );
  }
}

class IdentitySuccessPage extends StatelessWidget {
  const IdentitySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFDFDFD),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),

                          // عنوان النجاح
                          const Text(
                            'تم إنشاء هويتك بنجاح',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4E342E),
                            ),
                          ),

                          const SizedBox(height: 12),

                          const Text(
                            'يمكنك الآن استخدام هويتك الرقمية\n'
                            'والوصول إلى خدماتنا بسهولة وأمان',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.6,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 30),

                          // بطاقة الهوية
                          const IdentityCard(),

                          const SizedBox(height: 30),

                          // زر الدخول
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                // الانتقال إلى الصفحة الرئيسية
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:  Color(0xFF4E342E),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'الدخول إلى التطبيق',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
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

class IdentityCard extends StatelessWidget {
  const IdentityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE5F3EF),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // رأس البطاقة
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'البطاقة الشخصية',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'الجمهورية اليمنية',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF555555),
                      ),
                    ),
                  ],
                ),
              ),

              // شعار اليمن بشكل بسيط
              Column(
                children: const [
                  Icon(
                    Icons.park,
                    size: 30,
                    color: Color(0xFF4E342E),
                  ),
                  Text(
                    'اليمن',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF4E342E),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 15),

          // محتوى البطاقة
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة الشخصية
              Container(
                width: 82,
                height: 105,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4DCD9),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Icon(
                  Icons.person,
                  size: 65,
                  color: Color(0xFF53635F),
                ),
              ),

              const SizedBox(width: 16),

              // بيانات الهوية
              Expanded(
                child: Column(
                  children: const [
                    IdentityRow(
                      title: 'الاسم',
                      value: 'احمد علي محمد المطري',
                    ),
                    IdentityDivider(),
                    IdentityRow(
                      title: 'رقم الهوية',
                      value: '1234567890',
                    ),
                    IdentityDivider(),
                    IdentityRow(
                      title: 'تاريخ الميلاد',
                      value: '01/01/2001 مـ',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IdentityRow extends StatelessWidget {
  final String title;
  final String value;

  const IdentityRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF555555),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }
}

class IdentityDivider extends StatelessWidget {
  const IdentityDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 0.5,
      color: Color(0xFFCBD8D4),
    );
  }
}