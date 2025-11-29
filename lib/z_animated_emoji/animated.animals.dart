import 'package:streakit/z_animated_emoji/lottie_assets.dart';

class AnimalsEmojiModel {
  final String emoji;
  final String description;

  AnimalsEmojiModel({required this.emoji, required this.description});
}

List<AnimalsEmojiModel> animalsSpirts = [
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.whale,
      description:
          "Whales remind us to dive deep into our emotions, navigate life's vast oceans with grace, and let our inner song echo far and wide."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.turtle,
      description:
          "Turtles teach us that life is not a race; with patience and steady steps, we can weather any storm and find our way home."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.snake,
      description:
          "Snakes inspire us to shed our past, embrace transformation, and emerge stronger and wiser with each change."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.peacock,
      description:
          "Peacocks encourage us to strut our true colors, embrace our unique beauty, and let confidence shine in all that we do."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.dinosaur,
      description:
          "Dinosaurs remind us of our inner strength, the importance of adapting to challenges, and leaving a legacy that lasts."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.crab,
      description:
          "Crabs show us that sometimes it’s okay to sidestep obstacles, protect what matters, and embrace the tides of life."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.butterfly,
      description:
          "Butterflies remind us that even the toughest transformations can lead to a life of beauty, freedom, and joy."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.bee,
      description:
          "Bees inspire us to work hard, nurture our communities, and find sweetness even in the busiest of days."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.ant,
      description:
          "Ants teach us that no task is too small when we work together, and success comes from persistence and teamwork."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.shark,
      description:
          "Sharks embody focus and determination, reminding us to move forward boldly and trust our instincts to survive and thrive."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.dragon,
      description:
          "Dragons ignite our imagination and courage, encouraging us to chase our dreams fearlessly and embrace our inner magic."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.eagle,
      description:
          "Eagles inspire us to rise above challenges, see the bigger picture, and soar with purpose and strength."),
  AnimalsEmojiModel(
      emoji: AnimatedEmojis.gorilla,
      description:
          "Gorillas remind us of the power of kindness, the strength in unity, and the wisdom that comes from staying grounded."),
];

// pass emoji and get the description
String getAnimalDescription(String emoji) {
  return animalsSpirts
      .firstWhere((element) => element.emoji == emoji)
      .description;
}
