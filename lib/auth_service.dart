import 'package:firebase_auth/firebase_auth.dart';
import 'signin.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // สร้าง Stream สำหรับการฟังการเปลี่ยนแปลงสถานะผู้ใช้ (เข้าสู่ระบบ/ออกจากระบบ)
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // ฟังก์ชันเข้าสู่ระบบด้วยอีเมลและรหัสผ่าน
  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  // ฟังก์ชันลงทะเบียนด้วยอีเมลและรหัสผ่าน
  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print("Error registering: $e");
      return null;
    }
  }

  // ฟังก์ชันออกจากระบบ
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  // ฟังก์ชันรีเซ็ตรหัสผ่านผ่านอีเมล
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent");
    } catch (e) {
      print("Error sending password reset email: $e");
    }
  }

  // ฟังก์ชันอัปเดตรหัสผ่านใหม่
  Future<void> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      await user?.updatePassword(newPassword);
      print("Password updated successfully");
    } catch (e) {
      print("Error updating password: $e");
    }
  }
}
