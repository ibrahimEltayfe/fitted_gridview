library fitted_gridview;

import 'package:flutter/material.dart';

class FittedGridView extends StatefulWidget {
  final Widget Function(BuildContext context,int index) itemBuilder;
  final Widget Function(int remaining) remainingItemsOverlay;
  final int itemCount;
  final TextDirection? textDirection;
  final int maxItemDisplay;

  const FittedGridView({Key? key, required this.itemBuilder, required this.itemCount, required this.remainingItemsOverlay, this.textDirection = TextDirection.ltr,this.maxItemDisplay = 4}) : super(key: key);

  @override
  State<FittedGridView> createState() => _FittedGridViewState();
}

class _FittedGridViewState extends State<FittedGridView> {
  late int length;
  late int remainingItemsCount;
  late int halfLength;

  @override
  void initState() {
    length = widget.itemCount;
    remainingItemsCount = length - widget.maxItemDisplay;

    if(remainingItemsCount > 0){
      length = widget.maxItemDisplay;
    }

    halfLength = (length / 2).ceil();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_,size) {
          if(length == 1){
            return widget.itemBuilder(context,0);
          }

          return Row(
            textDirection: widget.textDirection,
            children: [
              Expanded(
                child: Column(
                  children: [
                    for(int i = 0; i< halfLength ; i++)
                      Expanded(
                        child: SizedBox(
                          width: _calculateWidth(i,size.maxWidth),
                          height: _calculateHeight(i,size.maxHeight),
                          child: widget.itemBuilder(context,i),
                        ),
                      )
                  ],
                ),
              ),

              Expanded(
                child: Column(
                    children: [
                      for(int i = halfLength; i< length ; i++)
                        if(remainingItemsCount > 0 && i == length-1)
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: _calculateWidth(i,size.maxWidth),
                                  height: _calculateHeight(i,size.maxHeight),
                                  child: widget.itemBuilder(context,i),
                                ),

                                Positioned.fill(
                                    child: widget.remainingItemsOverlay(remainingItemsCount)
                                ),
                              ],
                            ),
                          )
                        else
                          Expanded(
                            child: SizedBox(
                              width: _calculateWidth(i,size.maxWidth),
                              height: _calculateHeight(i,size.maxHeight),
                              child: widget.itemBuilder(context,i),
                            ),
                          )
                    ]
                ),
              )
            ],
          );
        }
    );
  }

  _calculateWidth(int index,double maxWidth){
    if((length == 3 && index == 2) || length == 1){
      return maxWidth;
    }

    return maxWidth / 2;
  }

  _calculateHeight(int index,double maxHeight){
    if((length == 3 && index == 2) || length < 3){
      return maxHeight;
    }

    return maxHeight / 2;
  }
}