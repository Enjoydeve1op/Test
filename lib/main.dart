import 'package:flutter/material.dart';

void main() {
  runApp(const CoupleBudgetApp());
}

class CoupleBudgetApp extends StatelessWidget {
  const CoupleBudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '우리집',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: const [
            BudgetHome(),
            SimplePage(title: '내역'),
            SimplePage(title: '통계'),
            SimplePage(title: '설정'),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '홈',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: '내역',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            label: '통계',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: '설정',
          ),
        ],
      ),
    );
  }
}

class BudgetHome extends StatelessWidget {
  const BudgetHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: const [
        Text(
          '우리집',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 38),

        Text(
          '9월 우리 부부가 쓴 돈',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF6B7684),
          ),
        ),

        SizedBox(height: 8),

        Text(
          '1,284,320원',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 28),

        SummaryCard(),

        SizedBox(height: 38),

        Text(
          '최근 내역',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        SizedBox(height: 12),

        TransactionTile(
          name: '이마트',
          description: '생활 · 공동',
          amount: '84,320원',
        ),

        TransactionTile(
          name: '스타벅스',
          description: '카페 · 나',
          amount: '5,500원',
        ),

        TransactionTile(
          name: '쿠팡',
          description: '생활 · 공동',
          amount: '31,900원',
        ),

        TransactionTile(
          name: '올리브영',
          description: '쇼핑 · 아내',
          amount: '42,000원',
        ),
      ],
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        children: [
          Expanded(
            child: SummaryItem(
              title: '나',
              amount: '420,100원',
            ),
          ),
          Expanded(
            child: SummaryItem(
              title: '아내',
              amount: '381,900원',
            ),
          ),
          Expanded(
            child: SummaryItem(
              title: '공동',
              amount: '482,320원',
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String title;
  final String amount;

  const SummaryItem({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF8B95A1),
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String name;
  final String description;
  final String amount;

  const TransactionTile({
    super.key,
    required this.name,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2F6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.credit_card,
              color: Color(0xFF6B7684),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF8B95A1),
                  ),
                ),
              ],
            ),
          ),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
