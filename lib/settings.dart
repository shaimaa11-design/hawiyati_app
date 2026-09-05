import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool biometricEnabled = true;
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  static const darkBrown = Color(0xFF4E342E);
  static const mediumBrown = Color(0xFF6D4C41);
  static const lightBrown = Color(0xFFD7CCC8);
  static const background = Color(0xFFFAF9F6);
  static const darkBackground = Color(0xFF2B211E);
  static const darkCard = Color(0xFF3E302C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          darkModeEnabled ? darkBackground : background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الإعدادات',
          style: TextStyle(
            color: darkModeEnabled
                ? Colors.white
                : darkBrown,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: darkModeEnabled
              ? Colors.white
              : darkBrown,
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _sectionTitle('الأمان والخصوصية'),

          _settingTile(
            icon: Icons.lock_outline,
            title: 'تغيير رمز الدخول',
            onTap: _showChangePasswordSheet,
          ),

          _settingTile(
            icon: Icons.fingerprint,
            title: 'المصادقة البيومترية',
            trailing: Switch(
              value: biometricEnabled,
              activeColor: darkBrown,
              onChanged: (value) {
                if (value) {
                  _showBiometricDialog();
                } else {
                  setState(() {
                    biometricEnabled = false;
                  });
                }
              },
            ),
          ),

          _settingTile(
            icon: Icons.privacy_tip_outlined,
            title: 'الخصوصية ومشاركة البيانات',
            onTap: () {},
          ),

          const SizedBox(height: 25),

          _sectionTitle('التنبيهات والإشعارات'),

          _settingTile(
            icon: Icons.notifications_none,
            title: 'الإشعارات',
            trailing: Switch(
              value: notificationsEnabled,
              activeColor: darkBrown,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),

          const SizedBox(height: 25),

          _sectionTitle('عام'),

          _settingTile(
            icon: Icons.dark_mode_outlined,
            title: 'الوضع الداكن',
            trailing: Switch(
              value: darkModeEnabled,
              activeColor: darkBrown,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              },
            ),
          ),

          _settingTile(
            icon: Icons.language,
            title: 'اللغة',
            subtitle: 'العربية',
            onTap: () {},
          ),

          _settingTile(
            icon: Icons.help_outline,
            title: 'المساعدة والدعم',
            onTap: () {},
          ),

          _settingTile(
            icon: Icons.info_outline,
            title: 'عن التطبيق',
            onTap: () {},
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              label: const Text(
                'تسجيل الخروج',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: darkModeEnabled
              ? lightBrown
              : darkBrown,
        ),
      ),
    );
  }

  Widget _settingTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: darkModeEnabled
            ? darkCard
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 3,
        ),

        leading: trailing ??
            Icon(
              Icons.chevron_left,
              color: darkModeEnabled
                  ? Colors.white
                  : darkBrown,
            ),

        trailing: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: darkModeEnabled
                ? mediumBrown
                : lightBrown,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: darkModeEnabled
                ? Colors.white
                : darkBrown,
          ),
        ),

        title: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: darkModeEnabled
                ? Colors.white
                : darkBrown,
          ),
        ),

        subtitle: subtitle == null
            ? null
            : Text(
                subtitle,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: mediumBrown,
                ),
              ),
      ),
    );
  }

  void _showChangePasswordSheet() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: background,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: lightBrown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'تغيير رمز الدخول',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkBrown,
                  ),
                ),

                const SizedBox(height: 20),

                _passwordField(
                  controller: currentPasswordController,
                  hint: 'رمز الدخول الحالي',
                ),

                const SizedBox(height: 12),

                _passwordField(
                  controller: newPasswordController,
                  hint: 'رمز الدخول الجديد',
                ),

                const SizedBox(height: 12),

                _passwordField(
                  controller: confirmPasswordController,
                  hint: 'تأكيد رمز الدخول الجديد',
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'تغيير الرمز',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _passwordField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      obscureText: true,
      textAlign: TextAlign.right,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: mediumBrown,
        ),
        filled: true,
        fillColor: lightBrown,
        prefixIcon: const Icon(
          Icons.lock_outline,
          color: darkBrown,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _showBiometricDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'تفعيل المصادقة البيومترية',
            textAlign: TextAlign.right,
          ),
          content: const Text(
            'سيتم استخدام بصمة الجهاز أو التعرف على الوجه لحماية تطبيق هويتي.',
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'إلغاء',
                style: TextStyle(
                  color: mediumBrown,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  biometricEnabled = true;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: darkBrown,
              ),
              child: const Text(
                'تفعيل',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}