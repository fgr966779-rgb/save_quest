import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // === ТЕМНАЯ ТЕМА (Dark Theme) ===
  static const Color background = Color(0xFF121220);     // Глубокий полночно-синий графит вместо черного
  static const Color cardBg = Color(0xFF1B1A2A);         // Карточки темной темы
  static const Color cardBgLight = Color(0xFF24233A);    // Выделения в темной теме
  
  // === СВЕТЛАЯ ТЕМА (Light Theme) ===
  static const Color lightBg = Color(0xFFF8F9FA);        // Чистый белый с серо-голубым оттенком
  static const Color lightSurface = Color(0xFFFFFFFF);   // Карточки светлой темы
  static const Color lightSurfaceMuted = Color(0xFFEEF1F6);

  // === АКЦЕНТЫ И ГРАДИЕНТЫ (Cyberpunk/Neon Accents) ===
  static const Color cyanAccent = Color(0xFF00E5FF);     // Goal A: PlayStation 5
  static const Color magentaAccent = Color(0xFFFF007F);  // Goal B: Gaming Monitor
  static const Color purpleGlow = Color(0xFF8B5CF6);     // Пурпурный для смешивания градиентов
  static const Color goldAccent = Color(0xFFFFC400);     // Стрики и достижения
  static const Color greenAccent = Color(0xFF39FF14);    // Успех, разблокировки
  static const Color blueAccent = Color(0xFF0D47A1);

  // === НЕОНОВЫЕ СВЕЧЕНИЯ ===
  static const Color cyanGlow = Color(0x4D00E5FF);
  static const Color magentaGlow = Color(0x4DFF007F);
  static const Color goldGlow = Color(0x4DFFC400);

  // === СТРИКИ И ОГОНЬ ===
  static const Color streakFireRed = Color(0xFFFF3D00);
  static const Color streakFireYellow = Color(0xFFFFEA00);
  static const Color fireOrange = Color(0xFFFF5722);

  // === ТЕКСТОВЫЕ ЦВЕТА ===
  // textPrimary softened from #F5F5FA — less eye-strain on OLED.
  static const Color textPrimary = Color(0xFFE8E8F2);
  static const Color textSecondary = Color(0xFFB0B0CC);     // was #9E9EBA — better contrast
  static const Color textMuted = Color(0xFF8A8AA8);         // was #5E5E7A — now passes WCAG AA

  static const Color textLightPrimary = Color(0xFF1E1E2C);
  static const Color textLightSecondary = Color(0xFF4E5566); // was #5E6278 — slightly darker
  static const Color textLightMuted = Color(0xFF7A8294);     // was #98A2B3 — passes WCAG AA on light bg

  // === ГРАНИЦЫ ===
  static const Color borderNeon = Color(0xFF231E3D);
  static const Color borderNeonActive = Color(0xFF433C73);

  // === СЕМАНТИЧЕСКИЕ ЦВЕТА (calmer, WCAG-friendly) ===
  // Use these for success/warning/danger instead of #39FF14/#FFEA00/redAccent.
  // Loud neons remain for confetti, level-up, and other celebration moments.
  static const Color semanticSuccess = Color(0xFF2ED477);
  static const Color semanticSuccessSoft = Color(0x332ED477);
  static const Color semanticWarning = Color(0xFFFFB020);
  static const Color semanticWarningSoft = Color(0x33FFB020);
  static const Color semanticDanger = Color(0xFFFF4D6D);
  static const Color semanticDangerSoft = Color(0x33FF4D6D);
}
