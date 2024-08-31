import 'package:flutter/material.dart';

const cardsData = <Map<String,dynamic>>[
{ 'elevation': 0.0, 'label': 'Elevation 0' },
{ 'elevation': 1.0, 'label': 'Elevation 1' },
{ 'elevation': 2.0, 'label': 'Elevation 2' },
{ 'elevation': 3.0, 'label': 'Elevation 3' },
{ 'elevation': 4.0, 'label': 'Elevation 4' },
{ 'elevation': 5.0, 'label': 'Elevation 5' },
];



class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),

      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Se usa para errores de pixeles en pantallas y poder hacer scroll.
      child: Column(
        children: [
          // Listado de tarjetas
          ...cardsData.map( 
            (card) => _CardType1( elevation: card['elevation'], label: card['label'], )
          ),

          ...cardsData.map( 
            (card) => _CardType2( elevation: card['elevation'], label: card['label'], )
          ),

          ...cardsData.map( 
            (card) => _CardType3( elevation: card['elevation'], label: card['label'], )
          ),

          ...cardsData.map( 
            (card) => _CardType4( elevation: card['elevation'], label: card['label'], )
          ),

          const SizedBox(height: 50,)
      ],
      ),
    );
  }
}

// Personalizacion de listado de tarjetas
class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )

          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder( // formas de las tarjetas.
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )

          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.onSurfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              )
              ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )

          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
      
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
      
      
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            )
            ),
      
         
      
        ],
      ),
    );
  }
}

