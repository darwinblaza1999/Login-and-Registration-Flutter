import 'package:app/Helper/bio_helper.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget{
  const HomeView({Key? key}): super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();


}
class _HomeViewState extends State<HomeView>{
bool showBiometric = false;
bool isAuthenticated = false;

@override
void initState(){
  super.initState();
  isBiometricAvailable();
}

isBiometricAvailable() async{
  showBiometric = await BiometricHelper().hasEnrolledBiometrics();
  setState(() {
    
  });
}
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Biometric Flutter'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showBiometric)
            ElevatedButton(
              onPressed: () async
              {
                 //isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {
                  // ignore: avoid_print
                  print("1123");
                });
              }, 
              child: const Text(
              'Biometric Login',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              ),
              ),
              const SizedBox(
                height: 50,
                ),
                if(isAuthenticated)
                const Text(
                  'Well done!, Athenticated',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                ),
          ],
          ),
      ),
    );
  }
}