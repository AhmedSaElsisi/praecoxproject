class EventsModel{

  String image;
  String text;
  String subtext;

  EventsModel({
    required this.image,
    required this.text,
    required this.subtext,
  });
}

List<EventsModel> itemEventsModel=[
  EventsModel(image: 'assets/images/BG.png', text: 'Ride to End ALZ®', subtext: 'A Ride to FuelAlzheimer\'s Research.'),
  EventsModel(image: 'assets/images/BG.png', text: 'Ride to End ALZ®', subtext: 'A Ride to FuelAlzheimer\'s Research.'),
];
