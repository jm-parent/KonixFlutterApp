import 'package:flutter/material.dart';
import 'package:konixflutter/Transformer/AccordionWidget.dart';
import 'package:konixflutter/Transformer/AccordionItem.dart';
import 'package:konixflutter/Datas/data.dart';

class TeamsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: AccordionWidget(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(index);

                  return AccordionItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ),
    );

  }
}