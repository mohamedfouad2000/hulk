import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});
//

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Center(
        child: Lottie.asset(
          'assets/images/404.json',
        ),
      ),
    );
  }
}
