import 'package:flutter/material.dart';
import 'package:readarc/Forget_Password/password_reset_page.dart';

class VerifyEmailPage extends StatefulWidget {
  final List<String>? preFilledCode;

  const VerifyEmailPage({super.key, this.preFilledCode});

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();

    // Pre-fill the text fields if the preFilledCode is provided
    if (widget.preFilledCode != null) {
      for (int i = 0; i < widget.preFilledCode!.length; i++) {
        _controllers[i].text = widget.preFilledCode![i];
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Check your email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'We sent a reset link to contact@dscode.com.\nEnter the 5-digit code mentioned in the email.',
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) => SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _controllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onChanged: (value) {
                      // Move focus to the next field automatically
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordResetConfirmationPage()),
                  );
                  String code =
                      _controllers.map((controller) => controller.text).join();
                  // Handle verification logic with the entered code
                  print("Entered Code: $code");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Verify Code'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle resend email logic
                print("Resend email tapped");
              },
              child: const Text('Resend email'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset Flow')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyEmailPage()),
                );
              },
              child: const Text('Verify Email Page (Empty Fields)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Example pre-filled code
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VerifyEmailPage(
                            preFilledCode: const [
                              '8',
                              '8',
                              '6',
                              '',
                              ''
                            ], // Pre-fill some fields
                          )),
                );
              },
              child: const Text('Verify Email Page (Pre-filled Fields)'),
            ),
          ],
        ),
      ),
    );
  }
}
