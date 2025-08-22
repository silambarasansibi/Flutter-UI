import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> places = [
    {
      'name': 'Railway Station',
      'location': 'chennai',
      'rating': '4.7',
      'image':
          'https://media.istockphoto.com/id/1226340114/photo/puratchi-thalaivar-dr-mgr-central-railway-station-chennai-central-railway-station-india.jpg?s=1024x1024&w=is&k=20&c=EFcNG3Be3aIq9mwtnUYTGwhe37uz-y0I2UJPp8mHe7U='
    },
    {
      'name': 'Tiruvanamalai Temple',
      'location': 'india',
      'rating': '4.9',
      'image':
          'https://media.istockphoto.com/id/153949698/photo/town-tiruvannamalai-tamil-nadu-india-aerial-view.jpg?s=1024x1024&w=is&k=20&c=uKDS2o5teLV1e60y-ttp167uDKUtuJYAeCu8B6yIZAg='
    },
    {
      'name': 'temple',
      'location': 'tamilnadu',
      'rating': '5',
      'image':
          'https://images.unsplash.com/photo-1603766806347-54cdf3745953?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    {
      'name': 'Tirupur Lake',
      'location': 'tamilnadu',
      'rating': '4.8',
      'image':
          'https://media.istockphoto.com/id/1350585667/photo/india-religion-hinduism-srikalahasteeswara-temple-located-in-srikalahasti-chittoor-district.jpg?s=612x612&w=0&k=20&c=kCaPRvSvspWKrnGQZr8l30bLFAPFfZGDA9x9Jhm6KO8='
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello guys 👋",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("Discover destinations",
                          style: TextStyle(color: Color(0xffc7c3c3)))
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1603415526960-f7e0328d0d4b"),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search destinations",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recommended",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See all",
                      style: TextStyle(color: Colors.blue, fontSize: 14))
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(place['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(place['name']!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            Text(place['location']!,
                                style: TextStyle(color: Colors.white70)),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(place['rating']!,
                                    style: TextStyle(color: Colors.white))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
