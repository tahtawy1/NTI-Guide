class FirebaseAuthErrorMapper {
  static String map(String code) {
    switch (code) {
      case 'invalid-credential':
        return 'Incorrect email or password';

      case 'invalid-email':
        return 'Invalid email format';

      case 'network-request-failed':
        return 'No internet connection';

      case 'user-not-found':
        return 'No user found with this email';

      case 'wrong-password':
        return 'Incorrect password';

      case 'email-already-in-use':
        return 'This email is already registered';

      case 'weak-password':
        return 'Password is too weak. Please use a stronger password';

      case 'user-disabled':
        return 'This account has been disabled. Please contact support';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later';

      case 'operation-not-allowed':
        return 'This sign-in method is not enabled';

      case 'requires-recent-login':
        return 'Please login again to continue';

      case 'credential-already-in-use':
        return 'This account is already linked with another user';

      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in method';

      case 'timeout':
        return 'Connection timeout. Please try again';

      case 'session-expired':
        return 'Session expired. Please login again';

      case 'popup-closed-by-user':
        return 'Sign in was cancelled';

      case 'cancelled':
        return 'Sign in cancelled by user';

      default:
        return 'Something went wrong. Please try again';
    }
  }
}
