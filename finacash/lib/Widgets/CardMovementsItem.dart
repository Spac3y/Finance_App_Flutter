import 'package:MondayReport/Helper/Movimentacoes_helper.dart';
import 'package:flutter/material.dart';

import 'CustomDialog.dart';

class CardMovementsItem extends StatelessWidget {
  final Movimentacoes mov;
  final bool lastItem;

  const CardMovementsItem({Key key, this.mov, this.lastItem = false})
      : super(key: key);

  _dialogEdit(BuildContext context, double width, Movimentacoes movement) {
    print(movement.toString());
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
            mov: movement,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _dialogEdit(context, width, mov);
            //_dialogConfimacao(context, width);
          },
          child: Container(
            //padding: EdgeInsets.all(width * 0.005),
            width: width,
            height: height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10,
                                offset: Offset(2, 3))
                          ]),
                      child: Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: mov.tipo == "r"
                              ? Icon(
                                  Icons.arrow_downward,
                                  color: Colors.green,
                                  size: width * 0.06,
                                )
                              : Icon(Icons.arrow_upward,
                                  color: Colors.red, size: width * 0.06)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.03),
                        child: Container(
                          width: width * 0.4,
                          child: Text(
                            mov.descricao,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mov.tipo == "r"
                                  ? Colors.green[700]
                                  : Colors.red[700],
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.044,
                            ),
                          ),
                        )),
                  ],
                ),
                Text(
                  mov.tipo == "r" ? "+ ${mov.valor}" : " ${mov.valor}",
                  style: TextStyle(
                    color:
                        mov.tipo == "r" ? Colors.green[700] : Colors.red[700],
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.044,
                  ),
                ),
              ],
            ),
          ),
        ),
        lastItem == true
            ? Container(
                height: 80,
              )
            : Container()
      ],
    );
  }
}
