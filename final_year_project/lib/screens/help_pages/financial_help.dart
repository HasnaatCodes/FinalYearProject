import 'package:final_year_project/screens/main_drawer.dart';
import 'package:flutter/material.dart';
import '../../components/info_button.dart';
import '../../components/body_text.dart';
import 'package:url_launcher/url_launcher.dart';

class FinancialHelp extends StatefulWidget {
  static const String id = 'financial_help';
  @override
  _FinancialHelpState createState() => _FinancialHelpState();
}

class _FinancialHelpState extends State<FinancialHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text('Financial Help'),
        backgroundColor: Colors.green.shade300,
      ),
      drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Here are some pages to help you manage your finances',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            BodyText(
                'Money Matters has a lot of financial advice to help you out including budgeting advice and tuition fees advice. '
                'You can navigate through their pages below. Alternatively, you can also contact them directly for personalised help.'),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'Manage Your Money',
              onPressed: () {
                launch(
                    'https://www.salford.ac.uk/askus/support/budgeting-and-managing-your-money');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'Debt Advice',
              onPressed: () {
                launch(
                    'https://testlivesalfordac.sharepoint.com/sites/Uos_Students/SitePages/Debt-Advice.aspx');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            InfoButton(
              text: 'Contact Money Matters Team',
              onPressed: () {
                launch('mailto:moneymatters@salford.ac.uk');
              },
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
