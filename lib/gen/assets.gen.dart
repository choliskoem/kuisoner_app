/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ant-design_setting-outlined.svg
  String get antDesignSettingOutlined =>
      'assets/icons/ant-design_setting-outlined.svg';

  /// File path: assets/icons/bx_home.svg
  String get bxHome => 'assets/icons/bx_home.svg';

  /// File path: assets/icons/bx_search-alt-2.svg
  String get bxSearchAlt2 => 'assets/icons/bx_search-alt-2.svg';

  /// File path: assets/icons/clarity_users-line.svg
  String get clarityUsersLine => 'assets/icons/clarity_users-line.svg';

  /// File path: assets/icons/eye-off.svg
  String get eyeOff => 'assets/icons/eye-off.svg';

  /// File path: assets/icons/ic_baseline-arrow-back.svg
  String get icBaselineArrowBack => 'assets/icons/ic_baseline-arrow-back.svg';

  /// File path: assets/icons/material-symbols_history.svg
  String get materialSymbolsHistory =>
      'assets/icons/material-symbols_history.svg';

  /// File path: assets/icons/ph_chalkboard-teacher.svg
  String get phChalkboardTeacher => 'assets/icons/ph_chalkboard-teacher.svg';

  /// File path: assets/icons/ph_student.svg
  String get phStudent => 'assets/icons/ph_student.svg';

  /// File path: assets/icons/tdesign_task.svg
  String get tdesignTask => 'assets/icons/tdesign_task.svg';

  /// File path: assets/icons/typcn_arrow-right-outline.svg
  String get typcnArrowRightOutline =>
      'assets/icons/typcn_arrow-right-outline.svg';

  /// File path: assets/icons/uil_save.svg
  String get uilSave => 'assets/icons/uil_save.svg';

  /// List of all assets
  List<String> get values => [
        antDesignSettingOutlined,
        bxHome,
        bxSearchAlt2,
        clarityUsersLine,
        eyeOff,
        icBaselineArrowBack,
        materialSymbolsHistory,
        phChalkboardTeacher,
        phStudent,
        tdesignTask,
        typcnArrowRightOutline,
        uilSave
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg_ung.jpg
  AssetGenImage get bgUng => const AssetGenImage('assets/images/bg_ung.jpg');

  /// File path: assets/images/logo_ung.png
  AssetGenImage get logoUng =>
      const AssetGenImage('assets/images/logo_ung.png');

  /// List of all assets
  List<AssetGenImage> get values => [bgUng, logoUng];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
