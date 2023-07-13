import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List of icons for the bottom navigation bar
  final items = const [
    Icon(
      Icons.search, // Search icon
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.publish_sharp, // Publish icon
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.person, // Person icon
      color: Colors.white,
      size: 30,
    ),
  ];

  int index = 0; // Current selected index of the bottom navigation bar

  final TextEditingController _departureController =
      TextEditingController(); // Text controller for the departure field
  final TextEditingController _destinationController =
      TextEditingController(); // Text controller for the destination field
  final TextEditingController _dateController =
      TextEditingController(); // Text controller for the date field
  final TextEditingController _seatsController =
      TextEditingController(); // Text controller for the seats field
  DateTime _selectedDate = DateTime.now(); // Selected date for the date field
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd'); // Date format
  int _selectedSeats = 1; // Selected number of seats

  @override
  void dispose() {
    _departureController.dispose();
    _destinationController.dispose();
    _dateController.dispose();
    _seatsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    // Function to select a date from a date picker
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _dateFormat.format(_selectedDate);
      });
    }
  }

  Future<void> _selectSeats(BuildContext context) async {
    // Function to select the number of seats from a dialog
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
      setState(() {
        _selectedSeats = selectedSeats;
        _seatsController.text = _selectedSeats.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Extend body to the bottom navigation bar
      bottomNavigationBar: CurvedNavigationBar(
        // Bottom navigation bar
        items: items, // List of navigation items
        index: index, // Current selected index
        onTap: (selectedIndex) {
          // Function called when a navigation item is tapped
          setState(() {
            index = selectedIndex; // Update the selected index
          });
        },
        height: 50, // Height of the navigation bar
        color: Colors.purple, // Color of the navigation bar
        backgroundColor:
            Colors.transparent, // Background color of the navigation bar
        animationDuration:
            const Duration(milliseconds: 300), // Duration of the animation
      ),
      body: Container(
        // Main container
        decoration: const BoxDecoration(
          // Background gradient
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1), // Gradient color 1
              Color.fromRGBO(58, 36, 73, 1), // Gradient color 2
            ],
            stops: [0.0, 1.0], // Gradient stops
            tileMode: TileMode.clamp, // Tile mode
            transform:
                GradientRotation(130 * 3.1415927 / 180), // Gradient rotation
          ),
        ),
        child: Center(
          child: Card(
            // Card container
            elevation: 4, // Elevation of the card
            shadowColor: Colors.black54, // Shadow color of the card
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Border radius of the card
            ),
            margin: const EdgeInsets.symmetric(
                horizontal: 20), // Margin of the card
            child: Padding(
              padding: const EdgeInsets.all(20), // Padding inside the card
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Set the column size to minimum
                children: [
                  TextFormField(
                    // Departure text field
                    controller:
                        _departureController, // Assign the text controller
                    onTap: () {
                      // Function called when the departure text field is tapped
                      if (index == 0) {
                        // Check if the search tab is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlaceSelectionScreen(
                              title:
                                  'Select Place of Departure', // Title of the place selection screen
                            ),
                          ),
                        );
                      }
                    },
                    decoration: const InputDecoration(
                      // Decoration for the departure text field
                      hintText: 'Place of Departure', // Label text
                      prefixIcon: Icon(Icons.location_on), // Leading icon
                      focusedBorder: UnderlineInputBorder(
                        // Underline border when the field is focused
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Spacer widget with fixed height
                  TextFormField(
                    // Destination text field
                    controller:
                        _destinationController, // Assign the text controller
                    onTap: () {
                      // Function called when the destination text field is tapped
                      if (index == 0) {
                        // Check if the search tab is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlaceSelectionScreen(
                              title:
                                  'Select Destination', // Title of the place selection screen
                            ),
                          ),
                        );
                      }
                    },
                    decoration: const InputDecoration(
                      // Decoration for the destination text field
                      labelText: 'Destination', // Label text
                      prefixIcon: Icon(Icons.location_on), // Leading icon
                      focusedBorder: UnderlineInputBorder(
                        // Underline border when the field is focused
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Spacer widget with fixed height
                  Row(
                    // Row widget to display the date and seats fields side by side
                    children: [
                      Expanded(
                        // Date field
                        flex: 3, // Take 3/4 of the available width
                        child: TextFormField(
                          // Date text field
                          onTap: () {
                            // Function called when the date text field is tapped
                            if (index == 0) {
                              _selectDate(context); // Show the date picker
                            }
                          },
                          controller:
                              _dateController, // Assign the text controller
                          decoration: const InputDecoration(
                            // Decoration for the date text field
                            labelText: 'Date of Departure', // Label text
                            prefixIcon:
                                Icon(Icons.calendar_today), // Leading icon
                            focusedBorder: UnderlineInputBorder(
                              // Underline border when the field is focused
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          keyboardType: TextInputType.datetime, // Keyboard type
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Spacer widget with fixed width
                      Expanded(
                        // Seats field
                        flex: 1, // Take 1/4 of the available width
                        child: TextFormField(
                          // Seats text field
                          onTap: () {
                            // Function called when the seats text field is tapped
                            if (index == 0) {
                              _selectSeats(context); // Show the seats dialog
                            }
                          },
                          controller:
                              _seatsController, // Assign the text controller
                          decoration: const InputDecoration(
                            // Decoration for the seats text field
                            labelText: 'Number of Seats', // Label text
                            prefixIcon: Icon(Icons.event_seat), // Leading icon
                            focusedBorder: UnderlineInputBorder(
                              // Underline border when the field is focused
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                          ),
                          keyboardType: TextInputType.number, // Keyboard type
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Spacer widget with fixed height
                  ElevatedButton.icon(
                    // Search button
                    onPressed: () {
                      // Function called when the search button is pressed
                      // Implement your search logic here
                    },
                    style: ButtonStyle(
                      // Style for the search button
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.purple), // Background color of the button
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.purple.withOpacity(
                            0.8), // Color of the button when pressed
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20), // Padding of the button
                      ),
                    ),
                    icon: const Icon(
                      Icons.search, // Search icon
                      color: Colors.white, // Color of the icon
                    ),
                    label: const Text(
                      'SEARCH', // Button label text
                      style: TextStyle(
                          color: Colors.white), // Color of the label text
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        title: Text(title), // Title of the app bar
      ),
      body: Container(
        // Main container
        decoration: const BoxDecoration(
          // Background gradient
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1), // Gradient color 1
              Color.fromRGBO(58, 36, 73, 1), // Gradient color 2
            ],
            stops: [0.0, 1.0], // Gradient stops
            tileMode: TileMode.clamp, // Tile mode
            transform:
                GradientRotation(130 * 3.1415927 / 180), // Gradient rotation
          ),
        ),
        child: Column(
          children: [
            Card(
              // Card container
              elevation: 4, // Elevation of the card
              shadowColor: Colors.black54, // Shadow color of the card
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Border radius of the card
              ),
              margin: const EdgeInsets.all(20), // Margin of the card
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Padding inside the card
                child: TextFormField(
                  // Search text field
                  decoration: const InputDecoration(
                    // Decoration for the search text field
                    labelText: 'Search', // Label text
                    border: InputBorder.none, // Remove border
                    suffixIcon: Icon(Icons.search), // Trailing icon
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor:
                      0.8, // Set the width of the button relative to its parent
                  child: ElevatedButton.icon(
                    // Current location button
                    onPressed: () {
                      // Function called when the current location button is pressed
                      // Implement your current location logic here
                    },
                    style: ButtonStyle(
                      // Style for the current location button
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white, // Background color of the button
                      ),
                    ),
                    icon: const Icon(
                      Icons.my_location, // Current location icon
                      color: Colors.black, // Color of the icon
                    ),
                    label: const Text(
                      'Use Current Location', // Button label text
                      style: TextStyle(
                        color: Colors.black, // Color of the label text
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
    required this.title,
    required this.minValue,
    required this.maxValue,
    required this.initialIntegerValue,
  });

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
      title: Text(widget.title), // Title of the dialog
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
                      icon: Icon(Icons.remove), // Minus icon button
                    ),
                    Text(
                      '$_selectedValue', // Current selected value
                      style: TextStyle(
                          fontSize: 24), // Font size of the value text
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_selectedValue < widget.maxValue) {
                            _selectedValue++;
                          }
                        });
                      },
                      icon: Icon(Icons.add), // Plus icon button
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
          child: const Text('OK'), // OK button text
          onPressed: () {
            Navigator.of(context).pop(
                _selectedValue); // Close the dialog and pass the selected value
          },
        ),
      ],
    );
  }
}
