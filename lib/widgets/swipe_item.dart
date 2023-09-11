import 'package:flutter/material.dart';
import 'package:swipecard/models/product.dart';

class SwipeItem extends StatefulWidget {
  const SwipeItem({super.key, required this.product});

  final Product product;

  @override
  State<SwipeItem> createState() => _SwipeItemState();
}

class _SwipeItemState extends State<SwipeItem> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: widget.product.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(widget.product.images[index]);
                  },
                ),
                (widget.product.images.length > 1)
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 4.0),
                              child: Text(
                                '${currentPage + 1}/${widget.product.images.length}',
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          // title
          Text(
            widget.product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          // price
          Text('฿${widget.product.price}'),
        ],
      ),
    );
  }
}
