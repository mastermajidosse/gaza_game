import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperCard extends StatelessWidget {
  final String name;
  final String username;
  final String linkto;
  final String profileImageUrl;
  final String description;

  DeveloperCard({
    required this.name,
    required this.username,
    required this.linkto,
    required this.description,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () async {
            Uri _url = Uri.parse(linkto);
            if (!await launchUrl(_url)) {
              throw Exception('Could not launch $_url');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '@$username',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      // SizedBox(height: 5),
                      // Text(
                      //   description,
                      //   style: TextStyle(
                      //     color: Colors.black87,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
