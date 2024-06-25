import 'package:farmicon/Utils/image_strings.dart';
import 'package:farmicon/screens/Detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SavedWidget extends StatelessWidget {
  const SavedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          children: <Widget>[
            CustomExpansionTile(
              title: 'Investor',
              count: 15,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen()));
                  },
                  child: Container(
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF403F3F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(children: [
                      const Positioned(
                        top: 10,
                        left: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Radhey Shyam Maan',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            Text('Femto',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 17,
                                ),
                                Text('Startup Mahakhumbh, Delhi',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text('View Details',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 0,
                          child: Column(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(appImages.logo)),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Hero(
                                tag: 'image',
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9R22gtAIP5m3rKwmu76_6rGWg579N9FWA_1bWAuSbOXnaQGwNtxLmEDBcRJS4uZiLp6E&usqp=CAU')),
                                    )),
                              ),
                            ],
                          )),
                      Positioned(
                        top: 10,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SvgPicture.asset(
                                    'assets/images/Group.svg')),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                              color: Color(0xFF865CD0),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.download,
                              color: Colors.white,
                            )),
                      )
                    ]),
                  ),
                ),
                ListTile(title: Text('Item 2')),
              ],
            ),
            CustomExpansionTile(
              title: 'Co-Founder',
              count: 15,
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
            ),
            CustomExpansionTile(
              title: 'Competitor',
              count: 10,
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
            ),
            CustomExpansionTile(
              title: 'Consumer',
              count: 50,
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
            ),
            CustomExpansionTile(
              title: 'Miscellaneous',
              count: 17,
              children: <Widget>[
                ListTile(title: Text('Item 1')),
                ListTile(title: Text('Item 2')),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final int count;
  final List<Widget> children;

  CustomExpansionTile({
    required this.title,
    required this.count,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(0.0),
        childrenPadding: const EdgeInsets.all(0.0),
        trailing: const SizedBox.shrink(),
        leading: const Icon(
          Icons.arrow_right,
          color: Colors.white,
        ),
        title: Text(
          '$title ($count)',
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        children: children,
        onExpansionChanged: (bool expanded) {
          // Optional: Change the icon when expanded
        },
      ),
    );
  }
}
