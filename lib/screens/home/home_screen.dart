import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:covoiturage/screens/home/profile_screen.dart';
import 'package:covoiturage/screens/home/publish_screen.dart';
//import 'package:covoiturage/screens/home/search_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = const [
    Icon(
      Icons.search,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.add,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person,
      color: Colors.white,
      size: 30,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        height: 50,
        color: Colors.purple,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: index == 0
                ? HomeContentCard()
                : (index == 1
                    ? const PublishScreen()
                    : (index == 2 ? ProfileScreen() : const SizedBox())),
          ),
        ),
      ),
    );
  }
}

class HomeContentCard extends StatefulWidget {
  @override
  State<HomeContentCard> createState() => _HomeContentCardState();
}

class _HomeContentCardState extends State<HomeContentCard> {
  final TextEditingController _departureController = TextEditingController();

  final TextEditingController _destinationController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final TextEditingController _seatsController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  int _selectedSeats = 1;

  @override
  void dispose() {
    _departureController.dispose();
    _destinationController.dispose();
    _dateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      _selectedDate = picked;
      _dateController.text = _dateFormat.format(_selectedDate);
    }
  }

  Future<void> _selectSeats(BuildContext context) async {
    final int? selectedSeats = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog(
          title: 'Select Number of Seats',
          minValue: 1,
          maxValue: 8,
          initialIntegerValue: _selectedSeats,
        );
      },
    );
    if (selectedSeats != null) {
      _selectedSeats = selectedSeats;
      _seatsController.text = _selectedSeats.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _departureController,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceSelectionScreen(
                      title: 'Select Place of Departure',
                    ),
                  ),
                );
              },
              decoration: const InputDecoration(
                labelText: 'Place of Departure',
                prefixIcon: Icon(Icons.location_on),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _destinationController,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlaceSelectionScreen(
                      title: 'Select Destination',
                    ),
                  ),
                );
              },
              decoration: const InputDecoration(
                labelText: 'Destination',
                prefixIcon: Icon(Icons.location_on),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    onTap: () {
                      _selectDate(context);
                    },
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date of Departure',
                      prefixIcon: Icon(Icons.calendar_today),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    onTap: () {
                      _selectSeats(context);
                    },
                    controller: _seatsController,
                    decoration: const InputDecoration(
                      labelText: 'Seats',
                      prefixIcon: Icon(Icons.event_seat),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.purple.withOpacity(0.8),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: const Text(
                'SEARCH',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceSelectionScreen extends StatelessWidget {
  final String title;

  const PlaceSelectionScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle current location functionality
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    icon: const Icon(
                      Icons.my_location,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Use Current Location',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberPickerDialog extends StatefulWidget {
  final String title;
  final int minValue;
  final int maxValue;
  final int initialIntegerValue;

  const NumberPickerDialog({
    Key? key,
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.initialIntegerValue,
  }) : super(key: key);

  @override
  _NumberPickerDialogState createState() => _NumberPickerDialogState();
}

class _NumberPickerDialogState extends State<NumberPickerDialog> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialIntegerValue;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedValue > widget.minValue) {
                            _selectedValue--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '$_selectedValue',
                      style: const TextStyle(fontSize: 24),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedValue < widget.maxValue) {
                            _selectedValue++;
                          }
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(_selectedValue);
          },
        ),
      ],
    );
  }
}
