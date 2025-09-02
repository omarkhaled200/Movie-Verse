import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_verse/Core/utlis/App_Router.dart';
import 'package:movie_verse/Core/utlis/assets.dart';

class CustomRowloginbygmailorapple extends StatefulWidget {
  const CustomRowloginbygmailorapple({super.key});

  @override
  State<CustomRowloginbygmailorapple> createState() =>
      _CustomRowloginbygmailorappleState();
}

class _CustomRowloginbygmailorappleState
    extends State<CustomRowloginbygmailorapple> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  bool _isLoading = false;

  Future<UserCredential?> signInWithGoogle() async {
    if (_isLoading) return null;

    setState(() {
      _isLoading = true;
    });

    try {
      print("🔄 بدء عملية تسجيل الدخول...");

      await _googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("❌ تم إلغاء العملية");
        return null;
      }

      print("✅ تم اختيار الحساب: ${googleUser.email}");

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw Exception("فشل في الحصول على authentication tokens");
      }

      print("✅ تم الحصول على tokens");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      print("✅ نجح تسجيل الدخول: ${userCredential.user?.displayName}");

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "مرحباً ${userCredential.user?.displayName ?? 'بك'}!",
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("❌ خطأ Firebase: ${e.code} - ${e.message}");
      String errorMessage = "خطأ في المصادقة";

      switch (e.code) {
        case 'invalid-credential':
          errorMessage = "بيانات المصادقة غير صحيحة";
          break;
        case 'user-disabled':
          errorMessage = "تم تعطيل الحساب";
          break;
        case 'operation-not-allowed':
          errorMessage = "طريقة تسجيل الدخول غير مفعلة";
          break;
        default:
          errorMessage = "خطأ: ${e.message}";
      }

      _showError(errorMessage);
      return null;
    } catch (e) {
      print("❌ خطأ عام: $e");

      String errorMessage = "حدث خطأ غير متوقع";
      if (e.toString().contains('popup_closed_by_user')) {
        errorMessage = "تم إغلاق نافذة تسجيل الدخول";
      } else if (e.toString().contains('network')) {
        errorMessage = "مشكلة في الاتصال بالإنترنت";
      }

      _showError(errorMessage);
      return null;
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showError(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 4),
          action: SnackBarAction(
            label: 'حسناً',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
                  final user = await signInWithGoogle();
                  if (user != null) {
                    GoRouter.of(context).push(AppRouter.homeview);
                  }
                },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: _isLoading ? 0 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: _isLoading ? Colors.grey[300] : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: _isLoading
                ? Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  )
                : Center(
                    child: Image.asset(
                      Assets.google,
                      width: 36,
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Image.asset(Assets.apple, width: 46)),
        ),
      ],
    );
  }
}
