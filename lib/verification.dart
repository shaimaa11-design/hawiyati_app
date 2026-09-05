import 'package:flutter/material.dart';
import 'face verification.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  double _progress = 0.0;
  int _currentStep = 0;

  static const darkBrown = Color(0xFF4E342E);
  static const mediumBrown = Color(0xFF6D4C41);
  static const lightBrown = Color(0xFFD7CCC8);
  static const background = Color(0xFFFAF9F6);
  static const cream = Color(0xFFF1E8E3);
  static const whiteText = Color(0xFFFAF9F6);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _progressAnimation.addListener(() {
      if (mounted) {
        setState(() {
          _progress = _progressAnimation.value;

          if (_progress < 0.33) {
            _currentStep = 0;
          } else if (_progress < 0.66) {
            _currentStep = 1;
          } else {
            _currentStep = 2;
          }
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFD7CCC8),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    5,
                    20,
                    25,
                  ),
                  child: Column(
                    children: [
                      _buildTitle(),
                      const SizedBox(height: 22),
                      _buildVerificationCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: whiteText,
              size: 23,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          'جاري التحقق',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'يتم الآن التحقق من بيانات هويتك',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'يرجى الانتظار...',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 20),
      decoration: BoxDecoration(
        color: mediumBrown,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: lightBrown.withOpacity(0.35),
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          _buildProgressCircle(),

          const SizedBox(height: 25),

          const Text(
            'نسبة التحقق',
            style: TextStyle(
              color: whiteText,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          _buildProgressBar(),

          const SizedBox(height: 8),

          _buildProgressNumbers(),

          const SizedBox(height: 22),

          _buildStep(
            title: 'التحقق من البيانات الشخصية',
            completed: _progress >= 0.33,
            active: _progress < 0.33,
          ),

          _buildConnector(
            active: _progress >= 0.33,
          ),

          _buildStep(
            title: 'التحقق من رقم الهوية',
            completed: _progress >= 0.66,
            active: _progress >= 0.33 && _progress < 0.66,
          ),

          _buildConnector(
            active: _progress >= 0.66,
          ),

          _buildStep(
            title: 'التحقق من بيانات الهوية',
            completed: _progress >= 1.0,
            active: _progress >= 0.66 && _progress < 1.0,
          ),

          const SizedBox(height: 20),

          _buildInfoBox(),
        ],
      ),
    );
  }

  Widget _buildProgressCircle() {
    final percentage = (_progress * 100).round();

    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 205,
            height: 205,
            child: CircularProgressIndicator(
              value: 1,
              strokeWidth: 10,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                lightBrown.withOpacity(0.35),
              ),
            ),
          ),

          SizedBox(
            width: 205,
            height: 205,
            child: CircularProgressIndicator(
              value: _progress,
              strokeWidth: 10,
              strokeCap: StrokeCap.round,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation<Color>(
                lightBrown,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.verified_user_outlined,
                color: lightBrown,
                size: 55,
              ),

              const SizedBox(height: 8),

              Text(
                '$percentage%',
                style: const TextStyle(
                  color: whiteText,
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 2),

              const Text(
                'جاري التحقق',
                style: TextStyle(
                  color: whiteText,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              _buildLoadingDots(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentStep
                ? lightBrown
                : Colors.white38,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: LinearProgressIndicator(
        minHeight: 13,
        value: _progress,
        backgroundColor: darkBrown,
        valueColor: const AlwaysStoppedAnimation<Color>(
          lightBrown,
        ),
      ),
    );
  }

  Widget _buildProgressNumbers() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '0%',
          style: TextStyle(
            color: whiteText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '50%',
          style: TextStyle(
            color: whiteText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '100%',
          style: TextStyle(
            color: whiteText,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildStep({
    required String title,
    required bool completed,
    required bool active,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: darkBrown.withOpacity(0.65),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          _buildStepIcon(
            completed: completed,
            active: active,
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: whiteText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 10),

          Text(
            completed
                ? 'تم'
                : active
                    ? 'جاري التحقق'
                    : 'انتظار',
            style: TextStyle(
              color: completed || active
                  ? lightBrown
                  : Colors.white54,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIcon({
    required bool completed,
    required bool active,
  }) {
    if (completed) {
      return Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: lightBrown,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check_rounded,
          color: darkBrown,
          size: 29,
        ),
      );
    }

    if (active) {
      return SizedBox(
        width: 48,
        height: 48,
        child: CircularProgressIndicator(
          strokeWidth: 4,
          valueColor: const AlwaysStoppedAnimation<Color>(
            lightBrown,
          ),
          backgroundColor: Colors.white24,
        ),
      );
    }

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white38,
          width: 2,
        ),
      ),
      child: const Icon(
        Icons.more_horiz_rounded,
        color: Colors.white54,
        size: 25,
      ),
    );
  }

  Widget _buildConnector({
    required bool active,
  }) {
    return Container(
      width: 3,
      height: 12,
      color: active
          ? lightBrown
          : Colors.white24,
    );
  }

  Widget _buildInfoBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: darkBrown.withOpacity(0.55),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: lightBrown.withOpacity(0.35),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: lightBrown,
            size: 32,
          ),

          SizedBox(width: 12),

          Expanded(
            child: Text(
              'قد تستغرق عملية التحقق بضع لحظات، يرجى عدم إغلاق التطبيق.',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: whiteText,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}