// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `轻记账`
  String get app_name {
    return Intl.message(
      '轻记账',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `输入邮箱`
  String get input_email {
    return Intl.message(
      '输入邮箱',
      name: 'input_email',
      desc: '',
      args: [],
    );
  }

  /// `输入密码`
  String get input_password {
    return Intl.message(
      '输入密码',
      name: 'input_password',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `新用户注册`
  String get app_new_user_register {
    return Intl.message(
      '新用户注册',
      name: 'app_new_user_register',
      desc: '',
      args: [],
    );
  }

  /// `注册新用户`
  String get app_register_new_user {
    return Intl.message(
      '注册新用户',
      name: 'app_register_new_user',
      desc: '',
      args: [],
    );
  }

  /// `忘记密码`
  String get app_forgot_password {
    return Intl.message(
      '忘记密码',
      name: 'app_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `找回密码`
  String get app_find_password {
    return Intl.message(
      '找回密码',
      name: 'app_find_password',
      desc: '',
      args: [],
    );
  }

  /// `请获取验证码`
  String get get_verify_code {
    return Intl.message(
      '请获取验证码',
      name: 'get_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `发送验证码`
  String get send_verify_code {
    return Intl.message(
      '发送验证码',
      name: 'send_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `请设置6-20位登录密码`
  String get set_login_password {
    return Intl.message(
      '请设置6-20位登录密码',
      name: 'set_login_password',
      desc: '',
      args: [],
    );
  }

  /// `请在此确认登录密码`
  String get confirm_login_password {
    return Intl.message(
      '请在此确认登录密码',
      name: 'confirm_login_password',
      desc: '',
      args: [],
    );
  }

  /// `同意`
  String get agree {
    return Intl.message(
      '同意',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `用户服务协议`
  String get user_agreement {
    return Intl.message(
      '用户服务协议',
      name: 'user_agreement',
      desc: '',
      args: [],
    );
  }

  /// `已有账户`
  String get exist_account {
    return Intl.message(
      '已有账户',
      name: 'exist_account',
      desc: '',
      args: [],
    );
  }

  /// `立即登录`
  String get go_login {
    return Intl.message(
      '立即登录',
      name: 'go_login',
      desc: '',
      args: [],
    );
  }

  /// `重置密码`
  String get reset_password {
    return Intl.message(
      '重置密码',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get commit {
    return Intl.message(
      '提交',
      name: 'commit',
      desc: '',
      args: [],
    );
  }

  /// `请在下面输入您的新密码`
  String get input_new_password {
    return Intl.message(
      '请在下面输入您的新密码',
      name: 'input_new_password',
      desc: '',
      args: [],
    );
  }

  /// `请在下面输入电子邮件以重新设置密码`
  String get input_email_reset_password {
    return Intl.message(
      '请在下面输入电子邮件以重新设置密码',
      name: 'input_email_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `下一步`
  String get next {
    return Intl.message(
      '下一步',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `收入`
  String get income {
    return Intl.message(
      '收入',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `支出`
  String get expense {
    return Intl.message(
      '支出',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `账单`
  String get order {
    return Intl.message(
      '账单',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `预算`
  String get budget {
    return Intl.message(
      '预算',
      name: 'budget',
      desc: '',
      args: [],
    );
  }

  /// `分类`
  String get category {
    return Intl.message(
      '分类',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `成员`
  String get member {
    return Intl.message(
      '成员',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `更多`
  String get more {
    return Intl.message(
      '更多',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `明细`
  String get home_detail {
    return Intl.message(
      '明细',
      name: 'home_detail',
      desc: '',
      args: [],
    );
  }

  /// `记账`
  String get home_record {
    return Intl.message(
      '记账',
      name: 'home_record',
      desc: '',
      args: [],
    );
  }

  /// `分析`
  String get home_analytics {
    return Intl.message(
      '分析',
      name: 'home_analytics',
      desc: '',
      args: [],
    );
  }

  /// `发现`
  String get home_find {
    return Intl.message(
      '发现',
      name: 'home_find',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get home_me {
    return Intl.message(
      '我的',
      name: 'home_me',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
