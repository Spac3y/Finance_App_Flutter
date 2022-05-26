import 'package:finacash/Helper/Movimentacoes_helper.dart';
import 'package:finacash/Widgets/CardMovementsItem.dart';
import 'package:finacash/Widgets/CustomDialog.dart';
import 'package:finacash/screen/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:finacash/global.dart' as globals;
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String saldoAtual = "";
  String saldoDespesa = "";
  String saldoRenda = "";
  var total;
  var totalDespesa;
  var totalRenda;
  var width;
  var height;
  bool infoBoard = false;
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();
  MovimentacoesHelper movHelper = MovimentacoesHelper();
  CalendarController calendarController;
  MovimentacoesHelper movimentacoesHelper = MovimentacoesHelper();
  List<Movimentacoes> listmovimentacoes = List();
  List<Movimentacoes> listmovimentacoesDespesa = List();
  List<Movimentacoes> listmovimentacoesRenda = List();

  var dataAtual = new DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');
  var formatterCalendar = new DateFormat('MM-yyyy');
  String dataFormatada;

  bool bol = false;

  Color backgroundColor = Color(0xFFFFFFFF);
  Color menuColor = Color(0xff212121);
  Color hoverColor = Color(0xff3D3D3D);
  Color primaryTextColor = Color(0xffFFFFFF);
  Color secondaryTextColor = Color(0xffAAAAAA);

  final List<Color> colorList = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  final List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];

  int index = 0;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  final List<String> wordList = ['Total', 'Total'];
  final List<String> calendarLang = ['en_US', 'ro_RO'];
  final List<String> wordList0 = ["Item deleted", "Item sters"];
  final List<String> wordList1 = ["Undo", "Anuleaza"];
  final List<String> wordList2 = ["History", "Istoric"];
  final List<String> wordList3 = ["All Income", "TotalVenit"];
  final List<String> wordList4 = ["All Expenses", "Total Cheltuieli"];

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  _saldoTamanho(String conteudo) {
    if (conteudo.length > 8) {
      return width * 0.08;
    } else {
      return width * 0.1;
    }
  }

  _allMovMes(String data) {
    movimentacoesHelper.getAllMovimentacoesPorMes(data).then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listmovimentacoes = list;
          //total =listmovimentacoes.map((item) => item.valor).reduce((a, b) => a + b);
        });
        total =
            listmovimentacoes.map((item) => item.valor).reduce((a, b) => a + b);
        saldoAtual = format(total).toString();
      } else {
        setState(() {
          listmovimentacoes.clear();
          total = 0;
          saldoAtual = total.toString();
        });
      }

      //print("TOTAL: $total");
      //print("All MovMES: $listmovimentacoes");
    });
  }

  _allExpenses() {
    movimentacoesHelper.getAllMovimentacoesPorDespesa().then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listmovimentacoesDespesa = list;
          //total =listmovimentacoes.map((item) => item.valor).reduce((a, b) => a + b);
        });
        totalDespesa = listmovimentacoesDespesa
            .map((item) => item.valor)
            .reduce((a, b) => a + b);
        saldoDespesa = format(totalDespesa).toString();
      } else {
        setState(() {
          listmovimentacoesDespesa.clear();
          totalDespesa = 0;
          saldoDespesa = totalDespesa.toString();
        });
      }

      //print("TOTAL: $total");
      //print("All MovMES: $listmovimentacoes");
    });
  }

  _allIncome() {
    movimentacoesHelper.getAllMovimentacoesPorRenda().then((list) {
      if (list.isNotEmpty) {
        setState(() {
          listmovimentacoesRenda = list;
          //total =listmovimentacoes.map((item) => item.valor).reduce((a, b) => a + b);
        });
        totalRenda = listmovimentacoesRenda
            .map((item) => item.valor)
            .reduce((a, b) => a + b);
        saldoRenda = format(totalRenda).toString();
      } else {
        setState(() {
          listmovimentacoesRenda.clear();
          totalRenda = 0;
          saldoRenda = totalRenda.toString();
        });
      }
      // print(saldoRendaj);
      //print("TOTAL: $total");
      //print("All MovMES: $listmovimentacoes");
    });
  }

  Widget incomePlusExpensesAllWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: width * 0.04,
              bottom: width * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  wordList3[globals.languageNumber],
                  style: TextStyle(
                      color: Colors.green[400], fontSize: width * 0.047),
                ),
                Text(
                  wordList4[globals.languageNumber],
                  style: TextStyle(
                      color: Colors.red[400], fontSize: width * 0.047),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Text(
                  saldoRenda,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.lightGreen[500], //Colors.indigo[400],
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.08
                      //width * 0.1 //_saldoTamanho(saldoAtual)
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.05),
                child: Text(
                  saldoDespesa,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.red, //Colors.indigo[400],
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.08
                      //width * 0.1 //_saldoTamanho(saldoAtual)
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget normalDashView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            top: width * 0.04,
            bottom: width * 0.02,
          ),
          child: Text(
            wordList[globals.languageNumber],
            style: TextStyle(color: Colors.grey[600], fontSize: width * 0.05),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Container(
                width: width * 0.6,
                child: Text(
                  saldoAtual,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.lightBlue[700], //Colors.indigo[400],
                    fontWeight: FontWeight.bold,
                    fontSize: _saldoTamanho(saldoAtual),
                    //width * 0.1 //_saldoTamanho(saldoAtual)
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: GestureDetector(
                onTap: () {
                  _dialogAddRecDesp();
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddReceita()));
                 */
                },
                child: Container(
                  width: width * 0.12,
                  height: width * 0.12, //65,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[700], //Colors.indigo[400],
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: Icon(
                    Icons.add,
                    size: width * 0.07,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.008,
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarController = CalendarController();
    // if (DateTime.now().month != false) {
    //saldoAtual = "1259";
    // }
    //_salvar();
    dataFormatada = formatterCalendar.format(dataAtual);
    print(dataFormatada);
    _allMovMes(dataFormatada);
    _allExpenses();
    _allIncome();

    //_allMov();
  }

  _dialogAddRecDesp() {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        bottomColor = Colors.blue;
      });
    });

    _allMovMes(dataFormatada);
    _allExpenses();
    _allIncome();
    return Scaffold(
      key: _scafoldKey,
      body: SingleChildScrollView(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        //physics: ClampingScrollPhysics(),
        //height: height,
        //width: width,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.334, //300,
                  // TODO
                  color: (globals.darkMode)
                      ? Color.fromARGB(255, 30, 30, 30)
                      : Colors.white,
                ),
                // TODO : change this to custuom live color
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    width: double.infinity,
                    height: height * 0.28, //250,
                    duration: Duration(seconds: 5),
                    onEnd: () => setState(
                      () {
                        index = index + 1;
                        // animate the color
                        bottomColor = colorList[index % colorList.length];
                        topColor = colorList[
                            (index + math.Random().nextInt(colorList.length)) %
                                colorList.length];

                        //// animate the alignment
                        begin = alignmentList[index % alignmentList.length];
                        end = alignmentList[(index + 1) % alignmentList.length];
                      },
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: begin,
                        end: end,
                        colors: [bottomColor, topColor],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: width * 0.20, //70
                  left: width * 0.07, //30,
                  child: Row(
                    children: [
                      Text(
                        // TODO
                        "FinaCash",
                        style: TextStyle(
                            // TODO
                            color: (globals.darkMode)
                                ? Colors.white
                                : primaryTextColor,
                            fontSize: width * 0.074 //30
                            ),
                      ),
                      SizedBox(
                        width: width * 0.46,
                      ),
                      IconButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SettingsPage()))),
                        icon: Icon(
                          Icons.settings_outlined,
                          // TODO

                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07, // 30,
                  right: width * 0.07, // 30,
                  child: GestureDetector(
                    onTap: () => setState(() => infoBoard = !infoBoard),
                    child: Container(
                        height: height * 0.16, //150,
                        width: width * 0.1, // 70,
                        decoration: BoxDecoration(
                            // TODO
                            color: (globals.darkMode)
                                ? backgroundColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[400],
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: (infoBoard)
                            ? incomePlusExpensesAllWidget()
                            : normalDashView()),
                  ),
                ),
              ],
            ),
            TableCalendar(
              calendarController: calendarController,
              locale: calendarLang[globals.languageNumber],
              headerStyle: HeaderStyle(
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                centerHeaderTitle: true,
              ),
              calendarStyle: CalendarStyle(outsideDaysVisible: false),
              daysOfWeekStyle: DaysOfWeekStyle(
                // TODO

                weekdayStyle: TextStyle(color: Colors.transparent),
                weekendStyle: TextStyle(color: Colors.transparent),
              ),
              rowHeight: 0,
              initialCalendarFormat: CalendarFormat.month,
              onVisibleDaysChanged: (dateFirst, dateLast, CalendarFormat cf) {
                print(dateFirst);

                dataFormatada = formatterCalendar.format(dateFirst);
                _allMovMes(dataFormatada);

                print("DATA FORMATADA CALENDAR $dataFormatada");

                //print("Data Inicial: $dateFirst ....... Data Final: $dateLast");
              },
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      wordList2[globals.languageNumber],
                      style: TextStyle(
                          color: (globals.darkMode)
                              ? primaryTextColor
                              : Colors.grey[600],
                          fontSize: width * 0.04),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02),
                      child: ElevatedButton(
                        onPressed: () => setState(() => bol = !bol),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5.5),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                        ),
                        child: (bol)
                            ? Icon(
                                Icons.sort,
                                size: width * 0.07,
                                // TODO

                                color: Colors.white,
                              )
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationX(math.pi),
                                child: Icon(
                                  Icons.sort,
                                  size: width * 0.07,
                                ),
                              ),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, right: width * 0.04, top: 0),
              child: SizedBox(
                width: width,
                height: height * 0.47,
                child: ListView.builder(
                  itemCount: listmovimentacoes.length,
                  itemBuilder: (context, index) {
                    int ind =
                        (bol) ? index : (listmovimentacoes.length - index - 1);
                    Movimentacoes mov = listmovimentacoes[ind];
                    Movimentacoes ultMov = listmovimentacoes[ind];

                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        //_dialogConfimacao(context, width, mov,index);

                        setState(() {
                          listmovimentacoes.removeAt(index);
                        });
                        movHelper.deleteMovimentacao(mov);
                        final snackBar = SnackBar(
                          content: Container(
                            padding: EdgeInsets.only(bottom: width * 0.025),
                            alignment: Alignment.bottomLeft,
                            height: height * 0.05,
                            child: Text(
                              wordList0[globals.languageNumber],
                              style: TextStyle(
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05),
                            ),
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.orange[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          action: SnackBarAction(
                            label: wordList1[globals.languageNumber],
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                listmovimentacoes.insert(index, ultMov);
                              });
                              movHelper.saveMovimentacao(ultMov);
                            },
                          ),
                        );
                        // _scafoldKey.currentState.showSnackBar(snackBar);
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      key: ValueKey(mov.id),
                      background: Container(
                        padding: EdgeInsets.only(right: 10, top: width * 0.04),
                        alignment: Alignment.topRight,
                        // TODO
                        color: Colors.red,
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: width * 0.07,
                        ),
                      ),
                      child: CardMovementsItem(
                        mov: mov,
                        lastItem:
                            listmovimentacoes[index] == listmovimentacoes.last
                                ? true
                                : false,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("EEEEEEEEE"),
            )
          ],
        ),
      ),
    );
  }
}
