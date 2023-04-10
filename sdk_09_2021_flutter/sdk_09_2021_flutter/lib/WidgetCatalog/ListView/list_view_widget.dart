import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          itemOne(),
          itemTwo(context),
          itemThree(context),
        ],
      ),
    );
  }

  Widget itemOne() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: CircleAvatar(
          maxRadius: 40,
          backgroundColor: Colors.black,
          child: Icon(
            Icons.person,
            size: 75,
          ),
        ),
      ),
    );
  }

  Widget itemTwo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'Fibonacci number',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  Widget itemThree(BuildContext context) {
    var text =
        'The Fibonacci sequence appears in Indian mathematics in connection with Sanskrit prosody, as pointed out by Parmanand Singh in 1986.[8][10][11] In the Sanskrit poetic tradition, there was interest in enumerating all patterns of long (L) syllables of 2 units duration, juxtaposed with short (S) syllables of 1 unit duration. Counting the different patterns of successive L and S with a given total duration results in the Fibonacci numbers: the number of patterns of duration m units is Fm + 1.[9]Knowledge of the Fibonacci sequence was expressed as early as Pingala (c. 450 BC–200 BC). Singh cites Pingala\'s cryptic formula misrau cha ("the two are mixed") and scholars who interpret it in context as saying that the number of patterns for m beats (Fm+1) is obtained by adding one [S] to the Fm cases and one [L] to the Fm−1 cases.[12] Bharata Muni also expresses knowledge of the sequence in the Natya Shastra (c. 100 BC–c. 350 AD).[13][7] However, the clearest exposition of the sequence arises in the work of Virahanka (c. 700 AD), whose own work is lost, but is available in a quotation by Gopala (c. 1135):[11]Variations of two earlier meters [is the variation]... For example, for [a meter of length] four, variations of meters of two [and] three being mixed, five happens. [works out examples 8, 13, 21]... In this way, the process should be followed in all mātrā-vṛttas [prosodic combinations].[a]Hemachandra (c. 1150) is credited with knowledge of the sequence as well,[7] writing that "the sum of the last and the one before the last is the number ... of the next mātrā-vṛtta."[15][16]';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
