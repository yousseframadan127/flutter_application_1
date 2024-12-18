import 'package:flutter/material.dart';

void main() {
  runApp(FinTrackApp());
}

class FinTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      home: BudgetPlannerScreen(),
    );
  }
}

class BudgetPlannerScreen extends StatelessWidget {
  final List<String> categories = [
    'Housing',
    'Food',
    'Transportation',
    'Entertainment',
    'Savings'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinTrack Budget Planner'),
        backgroundColor: Color(0xFF4A4E69),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return BudgetCategoryCard(category: categories[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add navigation to Add Expense screen
        },
        backgroundColor: Color(0xFF1D3557),
        child: Icon(Icons.add),
      ),
    );
  }
}

class BudgetCategoryCard extends StatelessWidget {
  final String category;

  const BudgetCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A4E69),
              ),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.5, // Example progress
              color: Color(0xFF1D3557),
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAddExpenseDialog(context, category);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A4E69),
              ),
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context, String category) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Expense for $category'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter expense amount'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle adding the expense
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
