import 'package:local_auth/local_auth.dart';

class BiometricHelper{
  final LocalAuthentication _authentication = LocalAuthentication();
  
  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics = await _authentication.getAvailableBiometrics();

    if(availableBiometrics.isNotEmpty){
      return true;
    }
    return false;
  }

  Future<bool> authenticate() async{
    final bool didAuhenticate = await _authentication.authenticate(
      localizedReason: "Please Authenticate to Process",
      options: const AuthenticationOptions(biometricOnly: true)
      );
      return didAuhenticate;
  }
}