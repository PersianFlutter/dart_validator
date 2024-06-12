import 'package:dart_validator/dart_validator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: FormValidation.validate([
                        LengthValidator(min: 8, max: 20),
                        AlphaDashValidator(),
                      ]),
                      decoration: const InputDecoration(labelText: 'User Name'),
                    ),
                    TextFormField(
                      validator: FormValidation.validate([
                        LengthValidator(min: 6),
                        PasswordValidator(),
                      ]),
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    TextFormField(
                      validator:
                          FormValidation.validate([AlphaNumericValidator()]),
                      decoration:
                          const InputDecoration(labelText: 'AlphaNumeric'),
                    ),
                    TextFormField(
                      validator: AlphaNumericDashValidator().validate,
                      decoration:
                          const InputDecoration(labelText: 'AlphaNumericDash'),
                    ),
                    TextFormField(
                      validator: AlphabeticalValidator().validate,
                      decoration:
                          const InputDecoration(labelText: 'Alphabetic'),
                    ),
                    TextFormField(
                      validator: CustomValidator(
                        RegExp(r'^[a-zA-Z0-9_-]+$'),
                        errorMessage: 'Custom Error Message',
                      ).validate,
                      decoration: const InputDecoration(labelText: 'Custom'),
                    ),
                    TextFormField(
                      validator: EmailValidator().validate,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      validator: GreaterValidator(10).validate,
                      decoration:
                          const InputDecoration(labelText: 'Greater than 10'),
                    ),
                    TextFormField(
                      validator: IntValidator().validate,
                      decoration: const InputDecoration(labelText: 'Int'),
                    ),
                    TextFormField(
                      validator: IpValidator().validate,
                      decoration: const InputDecoration(labelText: 'IP'),
                    ),
                    TextFormField(
                      validator: LengthValidator(min: 3, max: 10).validate,
                      decoration: const InputDecoration(labelText: 'Length'),
                    ),
                    TextFormField(
                      validator: LessValidator(10).validate,
                      decoration:
                          const InputDecoration(labelText: 'Less than 10'),
                    ),
                    TextFormField(
                      validator: MandatoryValidator().validate,
                      decoration: const InputDecoration(labelText: 'Mandatory'),
                    ),
                    TextFormField(
                      validator: NumericValidator().validate,
                      decoration: const InputDecoration(labelText: 'Numeric'),
                    ),
                    TextFormField(
                      validator: PasswordValidator().validate,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    TextFormField(
                      validator: PasswordValidator(
                              hasDigit: false, hasSpecialChars: false)
                          .validate,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                    TextFormField(
                      validator: UrlValidator().validate,
                      decoration: const InputDecoration(labelText: 'URL'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')));
                          }
                        },
                        child: const Text('Submit'))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
