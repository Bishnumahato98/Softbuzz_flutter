import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.94);

  int currentPage = 0;

  final List<Map<String, String>> matches = [
    {
      "series": "1st Test · England tour of Australia, 2025",
      "team1": "England",
      "flag1": "🇬🇧",
      "team2": "Australia",
      "flag2": "🇦🇺",
      "status": "Match starts at 9:30 AM",
    },
    {
      "series": "2nd ODI · Pakistan tour of Sri Lanka, 2025",
      "team1": "Pakistan",
      "flag1": "🇵🇰",
      "team2": "Sri Lanka           30-1 (5)",
      "flag2": "🇱🇰",
      "status": "Pak opt to bowl",
    },
    {
      "series": "1st T20I · Nepal tour of UAE, 2025",
      "team1": "Nepal",
      "flag1": "🇳🇵",
      "team2": "UAE",
      "flag2": "🇦🇪",
      "status": "Tomorrow · 7:15 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF3F3),

      // 🔰 APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff00B894),
        elevation: 0,
        titleSpacing: 16,

        title: Text(
          "Softbuzz",
          style: TextStyle(
            fontFamily: 'Poppins', // or 'Montserrat', 'Raleway', etc.
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(
              255,
              249,
              249,
              249,
            ), // or any brand color you like
            letterSpacing: 0.8,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            SizedBox(
              height: 190,
              child: PageView.builder(
                controller: _pageController,
                itemCount: matches.length,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                itemBuilder: (context, index) {
                  return matchCard(matches[index]);
                },
              ),
            ),

            const SizedBox(height: 8),
            indicatorDots(),

            const SizedBox(height: 14),

            topFeatures(),

            const SizedBox(height: 16),

            auctionTracker(),

            const SizedBox(height: 20),

            sectionTitle("Featured Videos"),
            horizontalCard(
              "IND vs AUS Pre-Match Show",
              "https://i.imgur.com/0rVeh4A.jpg",
            ),
            horizontalCard(
              "Why Pakistan struggles overseas?",
              "https://i.imgur.com/2nCt3Sb.jpg",
            ),

            const SizedBox(height: 16),

            sectionTitle("Trending"),
            horizontalCard(
              "Virat Kohli back in form?",
              "https://i.imgur.com/5tj6S7Ol.jpg",
            ),
            horizontalCard(
              "Nepal cricket on the rise",
              "https://i.imgur.com/DvpvklR.jpg",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget matchCard(Map<String, String> match) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                match["series"]!,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Text(match["flag1"]!, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Text(match["team1"]!, style: const TextStyle(fontSize: 16)),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  Text(match["flag2"]!, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 8),
                  Text(match["team2"]!, style: const TextStyle(fontSize: 16)),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                match["status"]!,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("SCHEDULE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ● ● ● INDICATOR
  Widget indicatorDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        matches.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 10 : 6,
          height: currentPage == index ? 10 : 6,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  // ⚡ TOP FEATURES
  Widget topFeatures() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          featureItem(Icons.gavel, "IPL Auction"),
          featureItem(Icons.flash_on, "Buzz"),
          featureItem(Icons.workspace_premium, "Go Ad-free"),
          featureItem(Icons.grid_view, "Browse Series"),
        ],
      ),
    );
  }

  Widget featureItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // 🏆 AUCTION TRACKER
  Widget auctionTracker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.gavel, color: Colors.white, size: 32),
          ),
          title: const Text(
            "IPL Auction Tracker",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            "Catch all the updates from the IPL 2026 auction",
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }

  // 📰 COMMON SECTION TITLE
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 🖼️ IMAGE + TEXT CARD
  Widget horizontalCard(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
