import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("fr", LocaleData.FR),
  MapLocale("en", LocaleData.EN),
  MapLocale("es", LocaleData.ES),
];

mixin LocaleData {
  static const String desc1 = 'desc1';
  static const String desc2 = 'desc2';
  static const String texte = 'texte';
  static const String option1 = 'option1';
  static const String option2 = 'option2';
  static const String option3 = 'option3';
  static const String option4 = 'option4';

  static const String option5 = 'option5';

  static const String option6 = 'option6';





  static const Map<String, dynamic> FR = {
    desc1:"   Etudiante en 3ème année IT",
    desc2:"   Spésialité en DSI",
  texte:"Je suis une élève motivée, ambitieuse, ayant le goût de l'initiative et du challenge, à l'aise avec le travail en équipe, je vise toujours le perfectionnisme. ",
    option1: 'Formation',
    option2: 'Projets',
    option3: 'Expérience professionnelles',
    option4: 'Langue et compétences',
    option5: 'Vie Associatives',
    option6: "Centre d'intérèts",
  };
  static const Map<String, dynamic> EN = {
    desc1:"   3rd year IT student",
    desc2:"   Specialization in DSI",
    texte:"I am a motivated, ambitious student, with a taste for initiative and challenge, comfortable with teamwork, I always aim for perfectionism.",
    option1: 'Education',
    option2: 'Projects',
    option3: 'Professional experience',
    option4: 'Language and skills',
    option5: 'Associative life',
    option6: "Center of interest",
  };

  static const Map<String, dynamic> ES = {
    desc1:"   estudiante de 3er año de IT",
    desc2:"   Especialización en DSI",
    texte:"Soy un estudiante motivado, ambicioso, con gusto por la iniciativa y el desafío, cómodo con el trabajo en equipo, busco siempre el perfeccionismo.",
    option1: 'Capacitación',
    option2: 'Proyectos',
    option3: 'Experiencia profesional',
    option4: 'Lenguaje y habilidades',
    option5: 'vida asociativa',
    option6: "Centro de interes",
  };


}
