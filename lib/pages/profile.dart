import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      // App Bar Section
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Profile Header Card
              _buildProfileCard(),
              const SizedBox(height: 16),

              // 2. Stats Row (Orders, Saved, Vouchers)
              _buildStatsRow(),
              const SizedBox(height: 24),

              // 3. Account & Preferences Section
              _buildSectionTitle('ACCOUNT & PREFERENCES'),
              const SizedBox(height: 12),
              _buildAccountPreferences(),
              const SizedBox(height: 24),

              // 4. Customer Care Section
              _buildSectionTitle('CUSTOMER CARE'),
              const SizedBox(height: 12),
              _buildCustomerCare(),
              const SizedBox(height: 24),

              // 5. Sign Out Button
              _buildSignOutButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Methods ---

  // Reused AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFA),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.architecture,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'ATELIER',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 16.0, left: 8.0),
        //   child: CircleAvatar(
        //     radius: 16,
        //     backgroundColor: Colors.grey.shade300,
        //     child: const Icon(Icons.person, color: Colors.grey, size: 20),
        //   ),
        // ),
      ],
    );
  }

  // Profile Header Card
  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Avatar placeholder
              Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        color: Colors.red,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Elena Rostova',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'elena.rostova@atelier.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.workspace_premium,
                                color: Color(0xFFD4AF37),
                                size: 10,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'VIP BLACK MEMBER',
                                style: TextStyle(
                                  color: Color(0xFFD4AF37),
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '• 1,450 pts',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Tier Milestone Progress
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'TIER MILESTONE',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    '550 pts to Obsidian Tier',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.7, // Simulated progress
                    child: Container(
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Stats Row
  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('12', 'ORDERS', Colors.black)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('6', 'SAVED', Colors.black)),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard('3', 'VOUCHERS', Colors.red)),
      ],
    );
  }

  Widget _buildStatCard(String value, String label, Color valueColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }

  // Account Preferences Card
  Widget _buildAccountPreferences() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildListTile(
            Icons.local_shipping_outlined,
            'Shipping Addresses',
            '742 Evergreen Terr, Seattle',
            trailingIcon: Icons.chevron_right,
          ),
          _buildDivider(),
          _buildListTile(
            Icons.credit_card_outlined,
            'Payment Methods',
            'Visa ending in 4291',
            trailingIcon: Icons.chevron_right,
          ),
          _buildDivider(),
          _buildListTile(
            Icons.notifications_none,
            'Notifications & Alerts',
            'Push and editorial emails active',
            trailingWidget: Switch(
              value: true,
              onChanged: (val) {},
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
            ),
          ),
          _buildDivider(),
          _buildListTile(
            Icons.language,
            'Currency & Language',
            'USD (\$) • English (US)',
            trailingIcon: Icons.chevron_right,
          ),
          _buildDivider(),
          _buildListTile(
            Icons.lock_outline,
            'Security & Password',
            'Biometrics enabled • 2FA',
            trailingIcon: Icons.chevron_right,
          ),
        ],
      ),
    );
  }

  // Customer Care Card
  Widget _buildCustomerCare() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _buildListTile(
            Icons.support_agent_outlined,
            'Live Chat Concierge',
            'VIP dedicated styling & orders',
            trailingIcon: Icons.chevron_right,
            iconColor: Colors.red.shade300,
            iconBackgroundColor: Colors.red.shade50,
            titleHasRedDot: true,
          ),
          _buildDivider(),
          _buildListTile(
            Icons.help_outline,
            'FAQs & Returns Policy',
            'Complimentary 30-day global returns',
            trailingIcon: Icons.chevron_right,
          ),
        ],
      ),
    );
  }

  // Generic List Tile
  Widget _buildListTile(
    IconData icon,
    String title,
    String subtitle, {
    IconData? trailingIcon,
    Widget? trailingWidget,
    Color? iconColor,
    Color? iconBackgroundColor,
    bool titleHasRedDot = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackgroundColor ?? Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor ?? Colors.black87),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (titleHasRedDot) ...[
                      const SizedBox(width: 6),
                      const Icon(Icons.circle, color: Colors.red, size: 6),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          if (trailingWidget != null)
            trailingWidget
          else if (trailingIcon != null)
            Icon(trailingIcon, size: 20, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  // Small internal divider
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 68, right: 16), // align with text
      child: Divider(height: 1, color: Colors.grey.shade200),
    );
  }

  // Sign Out Button
  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Colors.red, size: 18),
        label: const Text(
          'Sign Out',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade50,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
