class OnBoarding {
  final String image;
  final String text;
  final String title;
  final String subTitle;
  final String details;
  // final String textAnotherColor;
  // final String textFirstColor;

  const OnBoarding({
    required this.image,
    required this.text,
    required this.title,
    required this.subTitle,
    required this.details,
    // required this.textFirstColor
  });
}

List<OnBoarding> itemOnBoarding = [
  const OnBoarding(
      image: 'assets/on_boarding/grandma.png',
      text: 'Welcome',
      title: 'Your personalised',
      subTitle: 'Alzheimer\'s Memory Aid App',
      details: 'We\'re here to support you in managing your daily routines,'
          ' medication schedule, appointments, and memory enhancement activities.'),
  const OnBoarding(
      image: 'assets/on_boarding/calendar.png',
      text: 'Features',
      title: 'Peace of mind for you and your loved',
      subTitle: 'ones.',
      details:
          'praecox keeps you stay on track with your daily plans, medications, and doctor\'s appointments. Never miss an important schedule again.'),
  const OnBoarding(
      image: 'assets/on_boarding/alzheimer.png',
      text: 'Memory Enhancement',
      title: 'Boost your memory and cognitive',
      subTitle: 'skills with praecox.',
      details:
          'Engage in brain training exercises, memory challenges, and stimulating activities designed to enhance your mental capabilities. Let\'s keep your mind sharp!'),
  const OnBoarding(
      image: 'assets/on_boarding/medical-care.png',
      text: 'Communication',
      title: 'Stay connected with your caregivers',
      subTitle: 'and doctors.',
      details:
          'praecox provides a secure communication platform to exchange messages, share important updates, and access valuable resources and support.'),
  const OnBoarding(
      image: 'assets/on_boarding/smart-mobility.png',
      text: 'Location',
      title: 'Stay safe and independent, with the',
      subTitle: '"Where Am I?" map option.',
      details:
          'The "Where Am I?" map option allows patients to get their current location and helps them return home safely.'),
  const OnBoarding(
      image: 'assets/on_boarding/personal-settings.png',
      text: 'Make praecox your own',
      title: 'We ensure your preferences',
      subTitle: 'and privacy are prioritised.',
      details:
          'Customise your app settings, including reminders, notifications, and accessibility features.'),
  const OnBoarding(
      image: 'assets/on_boarding/happy-earth.png',
      text: 'Secure & Privacy',
      title: 'We\'re here to make your experience',
      subTitle: 'seamless.',
      details:
          'Keep your personal information secure, back up your data, and access useful app usage statistics.'),
];
