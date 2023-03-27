import 'package:flutter/material.dart';

class PlacesCard extends StatelessWidget {
  // final List<Map<String, String>> imageDetails;

  const PlacesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/tours/2');
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/test_image.png",
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    width: 350,
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Nagiri Hills",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_add_outlined,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: const [
                              Text(
                                "9",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " km from you",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                            Row(children: const [
                              Text(
                                "40",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " km from you",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ]),
                            const Text(
                              "Popular, Trending",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
