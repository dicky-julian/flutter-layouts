import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

Widget avatarSection = Image.asset(
  'lib/images/marsha.jpg',
  width: 600,
  height: 450,
  fit: BoxFit.cover,
);

Widget headerSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      titleSection,
      favoriteSection
    ],
  ),
);

Widget titleSection = Expanded(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.only(bottom: 8),
        child: const Text(
          'Oeschinen Lake Campground',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Text(
        'Kandersteg, Switzerland',
        style: TextStyle(color: Colors.grey[500]),
      ),
    ],
  ),
);

 Widget favoriteSection = Consumer<HomePageState>(
  builder: (context, counter, child) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.all(0),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.centerRight,
          icon: (counter.isFavorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)
          ),
          color: Colors.red[500],
          onPressed: () => counter.toggleFavorite(),
        ),
      ),
      SizedBox(
        width: 18,
        child: SizedBox(child: Text('${counter.favoriteCount}')),
      )
    ],
  ),
);

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    // By setting softwrap to true, text lines will fill the column width before wrapping at a word boundary.
    softWrap: true,
    style: TextStyle(
      height: 2,
      fontSize: 15,
    ),
  )
);

Widget buildButtonColumn (Color color, IconData icon, String label) => (
  Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color
          ),
        ),
      ),
    ],
  )
);