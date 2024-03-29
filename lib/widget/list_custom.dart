import 'package:ehealthapp/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCustom extends StatelessWidget {

  //Depois substituir pela sua entity
  final List<String>? value;
  final List<String>? value2;
  final List<String>? title;

  const ListCustom({super.key,
    this.value,
    this.value2,
    this.title,

  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: title != null,
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title == null ? '' : title![0],style:  const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  Text(title == null ? '' : title![1],style:  const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
          ),

          Container(
            decoration:BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: const BorderRadius.all( Radius.circular(10))
            ) ,
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration:BoxDecoration(
                            color: primaryColor,
                            border: Border.all(color: Colors.black12),
                            borderRadius: const BorderRadius.all(Radius.circular(10))
                        ) ,
                        child:ListView.builder(
                          padding: EdgeInsets.zero,

                          shrinkWrap: true,
                          itemCount: value!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text( value![index], style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                                  ),
                                ),

                              ],
                            );
                          },
                        )

                    )
                ),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,

                      shrinkWrap: true,
                      itemCount: value!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text( value2![index], style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
