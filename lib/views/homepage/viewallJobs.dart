import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/homepage/homepage.dart';

class AllJobsCards extends StatefulWidget {
  const AllJobsCards({super.key});

  @override
  _AllJobsCardsState createState() => _AllJobsCardsState();
}

class _AllJobsCardsState extends State<AllJobsCards> {
  final items = [
    CardItem(
      title: 'Job Card 1',
      createdAt: 'Saturday, August 8, 2024',
      serviceType: 'Engine Repair',
      status: 'In Progress',
      cost: '₹2500',
      colors: [const Color(0xFF38ef7d), const Color(0xFF11998e)],
    ),
    CardItem(
      title: 'Job Card 2',
      createdAt: 'Monday, October 17, 2024',
      serviceType: 'Oil Change',
      status: 'Scheduled',
      cost: '₹1800',
      colors: [const Color(0xFFFC5C7D), const Color(0xFF6A82FB)],
    ),
    CardItem(
      title: 'Job Card 3',
      createdAt: 'Saturday, August 8, 2024',
      serviceType: 'Transmission Fix',
      status: 'Completed',
      cost: '₹3000',
      colors: [const Color(0xFF38ef7d), const Color(0xFF11998e)],
    ),
    CardItem(
      title: 'Job Card 4',
      createdAt: 'Monday, October 17, 2024',
      serviceType: 'Suspension Adjustment',
      status: 'Pending',
      cost: '₹2200',
      colors: [const Color(0xFFFC5C7D), const Color(0xFF6A82FB)],
    ),
    CardItem(
      title: 'Job Card 5',
      createdAt: 'Friday, January 4, 2024',
      serviceType: 'Exhaust Repair',
      status: 'In Progress',
      cost: '₹4500',
      colors: [const Color(0xFFff9966), const Color(0xFFff5e62)],
    ),
    CardItem(
      title: 'Job Card 6',
      createdAt: 'Sunday, March 28, 2024',
      serviceType: 'Full Car Service',
      status: 'Completed',
      cost: '₹5000',
      colors: [const Color(0xFFad5389), const Color(0xFF3c1053)],
    ),
    CardItem(
      title: 'Job Card 7',
      createdAt: 'Monday, April 11, 2024',
      serviceType: 'Tire Replacement',
      status: 'In Progress',
      cost: '₹1500',
      colors: [const Color(0xFFFFD657), const Color(0xFFFFA453)],
    ),
    CardItem(
      title: 'Job Card 8',
      createdAt: 'Wednesday, June 24, 2024',
      serviceType: 'Brake System Repair',
      status: 'Completed',
      cost: '₹3200',
      colors: [const Color(0xFF00c6ff), const Color(0xFF0072ff)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          'All Jobs Card',
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 360, // Card width adjusted for better design
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CardView(item: items[index]),
                          const SizedBox(height: 20), // Space between cards
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final CardItem item;

  const CardView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            // Navigate to details or specific job view
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Header with Gradient
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: item.colors,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -140,
                      left: -200,
                      child: Text(
                        item.title.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                          fontSize: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Card Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.createdAt,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDetailChip(
                          context,
                          label: 'Service',
                          value: item.serviceType,
                          color: Colors.teal,
                        ),
                        _buildDetailChip(
                          context,
                          label: 'Status',
                          value: item.status,
                          color: item.status == 'In Progress'
                              ? Colors.orange
                              : Colors.green,
                        ),
                        // _buildDetailChip(
                        //   context,
                        //   label: 'Cost',
                        //   value: item.cost,
                        //   color: Colors.blue,
                        // ),
                      ],
                    ),
                  ],
                ),
              ),

              // View Details Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: Colors.teal[800]!,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(BuildContext context,
      {required String label, required String value, required Color color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
