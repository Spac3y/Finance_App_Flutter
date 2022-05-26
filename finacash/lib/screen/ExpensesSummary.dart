import 'package:finacash/Helper/Movimentacoes_helper.dart';
import 'package:finacash/Widgets/TimeLineItem.dart';
import 'package:flutter/material.dart';
import 'package:finacash/global.dart' as globals;

class ExpensesSummary extends StatefulWidget {
  @override
  _ExpensesSummaryState createState() => _ExpensesSummaryState();
}

class _ExpensesSummaryState extends State<ExpensesSummary> {
  MovimentacoesHelper movementsHelper = MovimentacoesHelper();
  List<Movimentacoes> listmovements = List();

  final List<String> wordList = ['Expenses', 'Cheltuieli'];

  _allMovPorTipo() {
    movementsHelper.getAllMovimentacoesPorTipo("d").then((list) {
      setState(() {
        listmovements = list;
      });
      print("All Mov: $listmovements");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allMovPorTipo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: width * 0.05, top: width * 0.2),
              child: Text(
                wordList[globals.languageNumber],
                style: TextStyle(
                    color: Colors.white, //Colors.grey[400],
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.08),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.03,
                top: width * 0.03,
              ),
              child: SizedBox(
                width: width,
                height: height * 0.74,
                child: ListView.builder(
                  itemCount: listmovements.length,
                  itemBuilder: (context, index) {
                    List movReverse = listmovements.reversed.toList();
                    Movimentacoes mov = movReverse[index];

                    if (movReverse[index] == movReverse.last) {
                      return TimeLineItem(
                        mov: mov,
                        colorItem: Colors.red[900],
                        isLast: true,
                      );
                    } else {
                      return TimeLineItem(
                        mov: mov,
                        colorItem: Colors.red[900],
                        isLast: false,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
