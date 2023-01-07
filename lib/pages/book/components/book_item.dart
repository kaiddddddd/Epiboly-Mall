import 'package:MallApp/components/white_button.dart';
import 'package:MallApp/pages/book/my_read_page.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

// author：kd
// describe：hasDesc

class BookItem extends StatefulWidget {
  final bool isDesc;

  final bool? showButton;

  final RecordType? type;

  final bool reversal;

  BookItem({required this.isDesc, this.showButton = false, this.type, this.reversal= false});

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  Map<String, dynamic> data = {
    "title": "《三体》",
    "desc": "三体是一部科幻小说，作者是刘慈欣，于2008年出版。该书是刘慈欣的代表作，也是中国科幻小说的代表作之一。该书于2008年获得第六届雨果奖最佳外国小说奖。",
    "image": "https://img3.doubanio.com/view/subject/l/public/s3369780.jpg",
    "status": 1,
  };

  @override
  Widget build(BuildContext context) {
    return widget.isDesc ? _buildDesc() : _buildNoDesc();
  }

  _buildNoDesc() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            'https://img3.doubanio.com/view/subject/l/public/s3369780.jpg',
            width: 96,
            height: 122,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '《三体》',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _buildDesc() {
    String buttonText = "";

    switch (widget.type) {
      case RecordType.read:
        buttonText = data["status"] == 1 ? "继续阅读" : "开始阅读";
        break;
      case RecordType.subscribe:
        buttonText = data["status"] == 1 ? "订阅" : "取消订阅";
        break;
      default:
        buttonText = "";
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // 反转
      textDirection: widget.reversal ? TextDirection.rtl : TextDirection.ltr,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            data["image"],
            width: 96,
            height: 122,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["title"],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  data["desc"],
                  // 最大三行，超出省略号
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                buttonText != ""
                    ? Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(top: 4),
                        child: RoundedButton(
                          width: 94,
                          height: 28,
                          text: buttonText,
                          textColor: AppColors.blue,
                          backgroundColor: Color(0xffecf4fe),
                          onPressed: () {
                            setState(() {
                              data["status"] = data["status"] == 1 ? 0 : 1;
                            });
                          },
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
