

import 'package:flutter/material.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmigoPet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5B4BDB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
      ),
      home: const CaregiversPage(),
    );
  }
}

class Caregiver {
  final String name;
  final String neighborhood;
  final double rating;
  final int reviews;
  final String service;
  final String description;
  final String emoji;

  const Caregiver({
    required this.name,
    required this.neighborhood,
    required this.rating,
    required this.reviews,
    required this.service,
    required this.description,
    required this.emoji,
  });
}

const caregivers = [
  Caregiver(
    name: 'Mariana Souza',
    neighborhood: 'Vila Madalena',
    rating: 4.9,
    reviews: 128,
    service: 'Passeios e hospedagem',
    description:
    'Apaixonada por animais, com experiência em cães de pequeno e médio porte.',
    emoji: '👩🏻',
  ),
  Caregiver(
    name: 'Carlos Oliveira',
    neighborhood: 'Pinheiros',
    rating: 4.8,
    reviews: 96,
    service: 'Passeios',
    description:
    'Passeador experiente e disponível para passeios durante a semana.',
    emoji: '👨🏽',
  ),
  Caregiver(
    name: 'Juliana Mendes',
    neighborhood: 'Perdizes',
    rating: 5.0,
    reviews: 74,
    service: 'Hospedagem',
    description:
    'Casa tranquila e segura para seu pet durante viagens e finais de semana.',
    emoji: '👩🏼',
  ),
  Caregiver(
    name: 'Rafael Santos',
    neighborhood: 'Lapa',
    rating: 4.7,
    reviews: 61,
    service: 'Passeios e banho',
    description:
    'Cuidados personalizados e muita atenção durante cada passeio.',
    emoji: '👨🏻',
  ),
  Caregiver(
    name: 'Beatriz Lima',
    neighborhood: 'Sumaré',
    rating: 4.9,
    reviews: 112,
    service: 'Hospedagem e banho',
    description:
    'Experiência com cães e gatos e ambiente preparado para receber pets.',
    emoji: '👩🏽',
  ),
];

class CaregiversPage extends StatelessWidget {
  const CaregiversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context,
        title: 'Cuidadores',
      ),

      // Drawer de navegação
      drawer: const AppDrawer(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 4),
            child: Text(
              'Encontre alguém de confiança',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF24213A),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Cuidadores disponíveis perto de você',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Lista
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              itemCount: caregivers.length,
              itemBuilder: (context, index) {
                final caregiver = caregivers[index];

                return CaregiverCard(
                  caregiver: caregiver,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CaregiverDetailsPage(
                          caregiver: caregiver,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CaregiverCard extends StatelessWidget {
  final Caregiver caregiver;
  final VoidCallback onTap;

  const CaregiverCard({
    super.key,
    required this.caregiver,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: const Color(0xFFE9E6FF),
                child: Text(
                  caregiver.emoji,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caregiver.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Color(0xFF5B4BDB),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          caregiver.neighborhood,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 17,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${caregiver.rating} (${caregiver.reviews})',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),

                    Text(
                      caregiver.service,
                      style: const TextStyle(
                        color: Color(0xFF5B4BDB),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// APP BAR
// ---------------------------------------------------------------------------

PreferredSizeWidget _buildAppBar(
    BuildContext context, {
      required String title,
    }) {
  return AppBar(
    backgroundColor: const Color(0xFF5B4BDB),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,

    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),

    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),

    actions: [
      PopupMenuButton<String>(
        icon: const Icon(Icons.tune),
        tooltip: 'Ordenar e filtrar',
        onSelected: (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Filtro selecionado: $value'),
            ),
          );
        },
        itemBuilder: (context) => const [
          PopupMenuItem(
            value: 'Mais próximos',
            child: Row(
              children: [
                Icon(Icons.near_me_outlined),
                SizedBox(width: 10),
                Text('Mais próximos'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Melhor avaliados',
            child: Row(
              children: [
                Icon(Icons.star_outline),
                SizedBox(width: 10),
                Text('Melhor avaliados'),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Menor preço',
            child: Row(
              children: [
                Icon(Icons.attach_money),
                SizedBox(width: 10),
                Text('Menor preço'),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

// ---------------------------------------------------------------------------
// DRAWER
// ---------------------------------------------------------------------------

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF5B4BDB),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Color(0xFF5B4BDB),
                size: 32,
              ),
            ),
            accountName: const Text(
              'Olá, tutor! 🐾',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              'Encontre cuidados para seu pet',
            ),
          ),

          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Cuidadores'),
            selected: true,
            selectedColor: const Color(0xFF5B4BDB),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text('Meus agendamentos'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Meus agendamentos'),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Configurações'),
                ),
              );
            },
          ),

          const Spacer(),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Ajuda'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// TELA DE DETALHES
// ---------------------------------------------------------------------------

class CaregiverDetailsPage extends StatelessWidget {
  final Caregiver caregiver;

  const CaregiverDetailsPage({
    super.key,
    required this.caregiver,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildDetailsAppBar(context),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Perfil
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: const Color(0xFFE9E6FF),
                    child: Text(
                      caregiver.emoji,
                      style: const TextStyle(fontSize: 48),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    caregiver.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF24213A),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF5B4BDB),
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        caregiver.neighborhood,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Avaliação
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _InfoItem(
                    icon: Icons.star,
                    value: caregiver.rating.toString(),
                    label: 'Avaliação',
                    color: Colors.amber,
                  ),
                  _InfoItem(
                    icon: Icons.rate_review_outlined,
                    value: '${caregiver.reviews}',
                    label: 'Avaliações',
                    color: const Color(0xFF5B4BDB),
                  ),
                  _InfoItem(
                    icon: Icons.pets,
                    value: '5+',
                    label: 'Anos',
                    color: const Color(0xFF4CAF50),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Sobre o cuidador',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              caregiver.description,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 26),

            // Tipo de serviço
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showServiceDialog(context);
                },
                icon: const Icon(Icons.pets),
                label: const Text('Tipo de serviço'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF5B4BDB),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: const BorderSide(
                    color: Color(0xFF5B4BDB),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Mais opções
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showBottomSheet(context);
                },
                icon: const Icon(Icons.more_horiz),
                label: const Text('Mais opções'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Cancelar agendamento
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showCancelDialog(context);
                },
                icon: const Icon(Icons.event_busy),
                label: const Text('Cancelar agendamento'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEBEE),
                  foregroundColor: const Color(0xFFD32F2F),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // AppBar da tela de detalhes
  PreferredSizeWidget _buildDetailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF5B4BDB),
      foregroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Perfil do cuidador',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          tooltip: 'Mais opções',
          onPressed: () {
            _showBottomSheet(context);
          },
        ),
      ],
    );
  }

  // -------------------------------------------------------------------------
  // ALERT DIALOG
  // -------------------------------------------------------------------------

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancelar agendamento?'),
          content: const Text(
            'Tem certeza que deseja cancelar o agendamento com '
                'este cuidador?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFD32F2F),
              ),
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text('Sim, cancelar'),
            ),
          ],
        );
      },
    );
  }

  // -------------------------------------------------------------------------
  // SIMPLE DIALOG
  // -------------------------------------------------------------------------

  void _showServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Tipo de serviço'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _showSelectedService(context, 'Passeio');
              },
              child: const ListTile(
                leading: Icon(Icons.directions_walk),
                title: Text('Passeio'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _showSelectedService(context, 'Hospedagem');
              },
              child: const ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text('Hospedagem'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _showSelectedService(context, 'Banho e tosa');
              },
              child: const ListTile(
                leading: Icon(Icons.content_cut),
                title: Text('Banho e tosa'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSelectedService(
      BuildContext context,
      String service,
      ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Serviço selecionado: $service'),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // BOTTOM SHEET
  // -------------------------------------------------------------------------

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Mais opções',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE9E6FF),
                    child: Icon(
                      Icons.share_outlined,
                      color: Color(0xFF5B4BDB),
                    ),
                  ),
                  title: const Text('Compartilhar perfil'),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Perfil pronto para compartilhar.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFFFEBEE),
                    child: Icon(
                      Icons.flag_outlined,
                      color: Colors.red,
                    ),
                  ),
                  title: const Text('Denunciar'),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Obrigado por enviar sua denúncia.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFF2F2F2),
                    child: Icon(Icons.close),
                  ),
                  title: const Text('Fechar'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// COMPONENTE DE INFORMAÇÃO
// ---------------------------------------------------------------------------

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _InfoItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
