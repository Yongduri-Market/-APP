import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yongduri_market/data/user_data.dart';

import '../main.dart';

InputDecoration inputDecoration = const InputDecoration(
  filled: true,
  fillColor: Colors.white,
  focusColor: Colors.white,
  hoverColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
);

InputDecoration inputDecoration2 = const InputDecoration(
  filled: true,
  fillColor: Colors.white,
  focusColor: Colors.white,
  hoverColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);

class AuthScreen extends StatefulWidget {
  static const route = 'auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  /// 로그인 및 회원가입 페이지 Controller
  PageController pageController = PageController();

  /// 아이디 입력 Controller
  TextEditingController idController = TextEditingController();

  /// 비밀번호 입력 Controller
  TextEditingController pwdController = TextEditingController();

  /// 학번 입력 Controller
  TextEditingController studentIDController = TextEditingController();

  /// 휴대폰 번호 입력 Controller
  TextEditingController phoneController = TextEditingController();

  /// 이메일 입력 Controller
  TextEditingController emailController = TextEditingController();

  /// 인증 코드 포커스 노드
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  /// 인증 코드 입력 Controller
  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();

  /// 비밀번호 입력 Controller
  TextEditingController nowPwdController = TextEditingController();
  TextEditingController newPwdController1 = TextEditingController();
  TextEditingController newPwdController2 = TextEditingController();

  /// 현재 페이지 정보
  ///
  /// 0 : 로그인 화면
  /// [pageController.page] = 0
  ///
  /// 1 : 회원가입 화면
  /// [pageController.page] = 0
  ///
  /// 2 : 이메일 인증 페이지
  /// [pageController.page] = 1
  ///  [isReset] false : 회원가입 이메일 확인
  ///  [isReset] true : 비밀번호 재설정
  ///
  /// 3 : 비밀번호 설정 or 재설정 화면
  /// [pageController.page] = 2
  ///  [isReset] false : 회원가입 시 비밀번호 입력 페이지
  ///  [isReset] true : 비밀번호 재설정 입력 페이지
  int pageIndex = 0;

  /// 비밀번호 재설정 중인지 여부
  bool isReset = false;

  /// 선택적 마케팅 수신 동의 체크 여부
  bool isChecked = false;

  /// 로그인 시 실행
  void login() {
    if (idController.text.isNotEmpty && pwdController.text.isNotEmpty) {
      isLoggedIn.value = true;
      print(idController.text);
      print(pwdController.text);
    }
  }

  /// 이메일 인증 코드 발송
  void sendCode() {
    FocusScope.of(context).unfocus();
    codeController1.text = '';
    codeController2.text = '';
    codeController3.text = '';
    codeController4.text = '';


    if (emailController.text.isNotEmpty) {
     Future.delayed(const Duration(milliseconds: 1000),(){
       codeController1.text = '1';
       codeController2.text = '2';
       codeController3.text = '3';
       codeController4.text = '4';
     });
    }
  }

  /// 회원가입 시 실행
  void signIn() {
    if (idController.text.isNotEmpty &&
        studentIDController.text.isNotEmpty &&
        int.tryParse(studentIDController.text) != null &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        newPwdController1.text.isNotEmpty &&
        newPwdController2.text.isNotEmpty &&
        newPwdController1.text == newPwdController2.text) {
      /// 유저 데이터 새로 생성
      UserData userData = UserData(
        userId: 001,
        studentId: int.parse(studentIDController.text),
        id: idController.text,
        email: emailController.text,
        pwd: pwdController.text,
        name: '이름',
        nickname: '닉네임',
        phone: phoneController.text,
        fileId: 0001,
        birthDate: DateTime(2024, 05, 30),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      print('계정 생성');
      print('마케팅 수신 여부 : $isChecked');
      isLoggedIn.value = true;
    }
  }

  /// 비밀번호 변경 시 실행
  void resetPassword() {
    if (nowPwdController.text.isNotEmpty &&
        newPwdController1.text.isNotEmpty &&
        newPwdController2.text.isNotEmpty &&
        newPwdController1.text == newPwdController2.text) {
      print('비밀번호 변경');
      isLoggedIn.value = true;
    }
  }

  @override
  void dispose() {
    pageController.dispose();

    idController.dispose();
    pwdController.dispose();
    studentIDController.dispose();
    phoneController.dispose();
    emailController.dispose();

    codeController1.dispose();
    codeController2.dispose();
    codeController3.dispose();
    codeController4.dispose();

    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();

    nowPwdController.dispose();
    newPwdController1.dispose();
    newPwdController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 화면 터치 시 텍스트 입력 페이지 포커스 해제
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          /// 로그인 화면이 아닐 시 뒤로가기 버튼 표시
          leading: pageIndex != 0
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      /// 이메일 인증 페이지일 경우
                      if (pageIndex == 2) {
                        /// 이전 페이지로 이동
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );

                        emailController.text = '';
                        codeController1.text = '';
                        codeController2.text = '';
                        codeController3.text = '';
                        codeController4.text = '';

                        /// 비밀번호 재설정 페이지 일 경우
                        if (isReset) {
                          /// 로그인 페이지로 이동
                          pageIndex = 0;
                        }

                        /// 비밀번호 재설정 페이지가 아닐경우
                        else {
                          /// 회원가입 페이지로 이동
                          pageIndex = 1;
                        }
                      }

                      /// 비밀번호 설정 & 재설정 페이지 일 경우
                      else if (pageIndex == 3) {
                        /// 이전 페이지로 이동
                        pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );

                        nowPwdController.text = '';
                        newPwdController1.text = '';
                        newPwdController2.text = '';

                        /// 페이지 정보 업데이트
                        pageIndex = 2;
                      } else {
                        /// 페이지 정보 업데이트
                        pageIndex -= 1;

                        phoneController.text = '';
                        studentIDController.text = '';
                      }
                    });
                  },
                )
              : null,
        ),
        body: SafeArea(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 72,
                    ),
                    SizedBox(
                      height: 112,
                      child: Center(
                        /// 메인 아이콘 이미지
                        child: SvgPicture.asset(
                          'assets/icons/ic_main.svg',
                          width: 112,
                          height: 112,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                      child: pageIndex == 1
                          ? const Center(
                              child: Text(
                                '시작하려면 가입하세요',
                                style: TextStyle(color: Color(0xff86C3D8)),
                              ),
                            )
                          : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        height: 48,

                        /// 아이디 입력창
                        child: TextFormField(
                          controller: idController,
                          decoration: inputDecoration.copyWith(hintText: '아이디'),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (pageIndex != 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SizedBox(
                          height: 48,

                          /// 비밀번호 입력창
                          child: TextFormField(
                            controller: pwdController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: inputDecoration.copyWith(hintText: '비밀번호'),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    if (pageIndex == 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SizedBox(
                          height: 48,

                          /// 학번 입력창
                          child: TextFormField(
                            controller: studentIDController,
                            decoration: inputDecoration.copyWith(hintText: '학번'),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    if (pageIndex == 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SizedBox(
                          height: 48,

                          /// 휴대폰 번호 입력창
                          child: TextFormField(
                            controller: phoneController,
                            decoration: inputDecoration.copyWith(hintText: '휴대폰 번호'),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    if (pageIndex == 1) const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (pageIndex == 0) {
                            login();
                          } else if (pageIndex >= 1 &&
                              idController.text.isNotEmpty &&
                              studentIDController.text.isNotEmpty &&
                              phoneController.text.isNotEmpty) {
                            setState(() {
                              pageIndex += 1;
                              pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Text(
                            pageIndex != 1 ? '로그인' : '다음',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    if (pageIndex != 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                pageIndex = 1;
                                isReset = false;
                              });
                            },
                            child: const Text(
                              '회원가입',
                              style: TextStyle(
                                color: Color(0xff86C3D8),
                              ),
                            ),
                          ),
                          const Text(
                            ' / ',
                            style: TextStyle(
                              color: Color(0xff86C3D8),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isReset = true;
                                pageIndex = 2;
                                pageController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                              });
                            },
                            child: const Text(
                              '비밀번호 재설정',
                              style: TextStyle(
                                color: Color(0xff86C3D8),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 256,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/ic_main.svg',
                          width: 112,
                          height: 112,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 48,

                              /// 이메일 입력창
                              child: TextFormField(
                                controller: emailController,
                                decoration: inputDecoration.copyWith(hintText: '이메일'),
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                sendCode();
                              },
                              child: const Text(
                                '전송',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      '받은 코드를 입력하세요',
                      style: TextStyle(
                        color: Color(0xff86C3D8),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: SizedBox(
                        width: 360,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 48),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,

                                /// 코드1 입력창
                                child: TextFormField(
                                  focusNode: focusNode1,
                                  controller: codeController1,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode2.requestFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: inputDecoration2.copyWith(counterText: ''),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 48,
                                height: 48,

                                /// 코드2 입력창
                                child: TextFormField(
                                  focusNode: focusNode2,
                                  controller: codeController2,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode3.requestFocus();
                                    } else {
                                      focusNode1.requestFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: inputDecoration2.copyWith(counterText: ''),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 48,
                                height: 48,

                                /// 코드3 입력창
                                child: TextFormField(
                                  focusNode: focusNode3,
                                  controller: codeController3,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      focusNode4.requestFocus();
                                    } else {
                                      focusNode2.requestFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: inputDecoration2.copyWith(counterText: ''),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 48,
                                height: 48,

                                /// 코드4 입력창
                                child: TextFormField(
                                  focusNode: focusNode4,
                                  controller: codeController4,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length != 1) {
                                      focusNode3.requestFocus();
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: inputDecoration2.copyWith(counterText: ''),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            sendCode();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              '코드 재전송',
                              style: TextStyle(
                                color: Color(0xff86C3D8),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (emailController.text.isNotEmpty &&
                                  codeController1.text.isNotEmpty &&
                                  codeController2.text.isNotEmpty &&
                                  codeController3.text.isNotEmpty &&
                                  codeController4.text.isNotEmpty) {
                                pageController.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                                pageIndex = 3;
                              }
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              '인증확인',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 256,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/ic_main.svg',
                          width: 112,
                          height: 112,
                        ),
                      ),
                    ),
                    if (isReset) const SizedBox(height: 24),
                    if (isReset)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SizedBox(
                          height: 48,

                          /// 기존 비밀번호 입력창
                          child: TextFormField(
                            controller: nowPwdController,
                            decoration: inputDecoration.copyWith(hintText: '기존 비밀번호'),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        height: 48,

                        /// 새 비밀번호 입력창
                        child: TextFormField(
                          controller: newPwdController1,
                          decoration: inputDecoration.copyWith(hintText: '비밀번호'),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: SizedBox(
                        height: 48,

                        /// 새 비밀번호 확인 입력창
                        child: TextFormField(
                          controller: newPwdController2,
                          decoration: inputDecoration.copyWith(hintText: '비밀번호 재입력'),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (!isReset)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '선택적 마케팅 수신 동의',
                            style: TextStyle(
                              color: Color(0xff86C3D8),
                              fontSize: 14,
                            ),
                          ),

                          /// 마케팅 수신 동의 체크박스
                          Checkbox(
                            activeColor: const Color(0xff86C3D8),
                            checkColor: Colors.white,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          )
                        ],
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (isReset) {
                            resetPassword();
                          } else {
                            signIn();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 48),
                          child: Text(
                            '로그인',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
