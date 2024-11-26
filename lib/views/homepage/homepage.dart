import 'package:flutter/material.dart';
import 'package:flutter_car_service_ui/views/login/service_details_screen.dart';
import 'package:flutter_car_service_ui/views/login/customAppbar.dart';
import 'package:gap/gap.dart';

class CardItem {
  final String title;
  final String createdAt;
  final String serviceType;
  final String status;
  final String cost;
  final List<Color> colors;

  CardItem({
    required this.title,
    required this.createdAt,
    required this.serviceType,
    required this.status,
    required this.cost,
    required this.colors,
  });
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final items = [
    CardItem(
      title: 'Current Job Card',
      createdAt: 'Saturday, August 8, 2024',
      serviceType: 'Engine Repair',
      status: 'In Progress',
      cost: '₹3000',
      colors: [const Color(0xFF38ef7d), const Color(0xFF11998e)],
    ),
    CardItem(
      title: 'Next Job Card',
      createdAt: 'Monday, October 17, 2024',
      serviceType: 'Oil Change',
      status: 'Scheduled',
      cost: '₹2500',
      colors: [const Color(0xFFFC5C7D), const Color(0xFF6A82FB)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SizedBox(
          width: 360, // Improved card size for better layout
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AppBarCustomCurved(),
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
                          const SizedBox(height: 20),
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
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder: (context, animation, _, child) {
                  animation = CurvedAnimation(
                      parent: animation, curve: Curves.easeInToLinear);
                  return ScaleTransition(scale: animation, child: child);
                },
                pageBuilder: (context, _, __) => const ServiceDetailsScreen(),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Header with gradient
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
                    const Gap(5),
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
