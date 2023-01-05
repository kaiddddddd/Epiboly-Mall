import 'package:flutter/material.dart';

// author：kd
// describe：hasDesc

class BookItem extends StatelessWidget {
  final bool isDesc;

  BookItem({required this.isDesc});

  @override
  Widget build(BuildContext context) {
    return isDesc ? _buildDesc() : _buildNoDesc();
  }

  _buildNoDesc() {
    return Container(
      child: Column(
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
      ),
    );
  }

  _buildDesc() {
    return Container(
      child: Row(
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
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '《三体》',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '三体是一部科幻小说，作者是刘慈欣，于2008年出版。该书是刘慈欣的代表作，也是中国科幻小说的代表作之一。该书于2008年获得第六届雨果奖最佳外国小说奖。',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
