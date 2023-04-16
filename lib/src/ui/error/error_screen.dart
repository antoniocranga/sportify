import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('H1', style: Theme.of(context).textTheme.displayLarge),
            Text('H2', style: Theme.of(context).textTheme.displayMedium),
            Text('H3', style: Theme.of(context).textTheme.displaySmall),
            Text('H4', style: Theme.of(context).textTheme.headlineMedium),
            Text('H5', style: Theme.of(context).textTheme.headlineSmall),
            Text('H6', style: Theme.of(context).textTheme.titleLarge),
            Text('BT1', style: Theme.of(context).textTheme.bodyLarge),
            Text('BT2', style: Theme.of(context).textTheme.bodyMedium),
            Text('Button', style: Theme.of(context).textTheme.labelLarge),
            Text('Caption', style: Theme.of(context).textTheme.bodySmall),
            const TextField(
              decoration: InputDecoration(
                  hintText: 'email@email.com',
                  label: Text('email'),
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.visibility)),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated button')),
            const Icon(Icons.home),
          ],
        ),
      ),
    );
  }
}
