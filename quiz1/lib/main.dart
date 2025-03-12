import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Use a teal color scheme for a fresh, inviting look
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        // Give the entire scaffold a subtle teal tint
        scaffoldBackgroundColor: Colors.teal.shade50,
        // Customize default text styles
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
          ),
        ),
      ),
      home: const BiddingPage(title: 'Bidding Page'),
    );
  }
}

/// A [StatefulWidget] that displays a simple bidding interface.
///
/// Users can increase or decrease their bid by \$50 using the buttons provided.
class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key, required this.title});

  /// The title that appears in the app bar.
  final String title;

  @override
  State<BiddingPage> createState() => _BiddingPageState();
}

/// The state class for [BiddingPage], which holds the current bid amount.
class _BiddingPageState extends State<BiddingPage> {
  /// Tracks the current bid amount.
  int _currentBid = 0;

  /// Decreases the bid by \$50, ensuring it doesn't go below zero.
  void _decreaseBid() {
    if (_currentBid > 0) {
      setState(() {
        _currentBid -= 50;
      });
    }
  }

  /// Increases the bid by \$50.
  void _increaseBid() {
    setState(() {
      _currentBid += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a teal color and centered title for a neat, modern look
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        // Add padding around the content for a cleaner layout
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Show the current bid in a large, bold style with a dollar sign
              Text(
                '\$$_currentBid',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              // Row of buttons to decrease or increase the bid
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Button to lower the bid by $50
                  ElevatedButton(
                    onPressed: _decreaseBid,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Decrease Bid \$50',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Button to raise the bid by $50
                  ElevatedButton(
                    onPressed: _increaseBid,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Increase Bid \$50',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}