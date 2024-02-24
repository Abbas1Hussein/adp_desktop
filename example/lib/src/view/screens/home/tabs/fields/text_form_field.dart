import 'package:adp_desktop/adp_desktop.dart';

class TextFormFieldPreview extends StatefulWidget {
  const TextFormFieldPreview({Key? key}) : super(key: key);

  @override
  State<TextFormFieldPreview> createState() => _TextFormFieldPreviewState();
}

class _TextFormFieldPreviewState extends State<TextFormFieldPreview> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(),
      contentPadding: const EdgeInsets.all(20.0),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdaptiveTextFormField(
              controller: _usernameController,
              placeholder: 'Username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            AdaptiveTextFormField(
              controller: _passwordController,
              placeholder: 'Password',
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            AdaptiveButton(
              onPressed: _submitForm,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    final isAuthenticated = _formKey.currentState!.validate();
    if (isAuthenticated) {
      final username = _usernameController.text;

      DialogPresenter.showInformationDialog(
        context,
        title: 'Login Successful',
        message: 'Welcome, $username!',
      );
    } else {
      DialogPresenter.showInformationDialog(
        context,
        title: 'Login Failed',
        message: 'Invalid username or password. Please try again.',
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
