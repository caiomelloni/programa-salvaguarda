import 'package:projeto_salvaguarda_admin/model/activity.dart';
import 'package:projeto_salvaguarda_admin/model/user.dart';

final allUsers = <User>[
  User(
    name: 'Emma',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'aliveFrank@t-online.de',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description:
              "Corrigi 2 redações da Ana Almeida, 3 do Gustavo dos Santos e 3 da Júlia da silva. Forneci feedback construtivos de como poderiam ter feito melhores redações aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          feedback:
              "Corrigi 2 redações da Ana Almeida, 3 do Gustavo dos Santos e 3 da Júlia da silva. Forneci feedback construtivos de como poderiam ter feito melhores redações sdvfvfsvaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Max',
    role: 'Corretor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Stevehomeless@live.ca',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2019, 7, 20),
      DateTime.utc(2021, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Sarah',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'selfishCassie73@me.com',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2022, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2021, 1, 6),
    ],
  ),
  User(
    name: 'James',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'lovelyWayne@bigpond.net.au',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2021, 7, 20),
      DateTime.utc(2020, 8, 29),
      DateTime.utc(2019, 1, 6),
    ],
  ),
  User(
    name: 'Lorita',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'tenseKyle@rocketmail.com',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2022, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2022, 1, 6),
    ],
  ),
  User(
    name: 'Anton',
    role: 'Correto',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Brendanhealthy@laposte.net',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2023, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Salina',
    role: 'Corretor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'nuttyCrystal44@yandex.ru',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2023, 1, 8),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Sunday',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'panickyJessica@optusnet.com.au',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2020, 8, 29),
      DateTime.utc(2020, 1, 6),
    ],
  ),
  User(
    name: 'Alva',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'alivePhilip73@yahoo.com.mx',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2019, 7, 20),
      DateTime.utc(2019, 8, 29),
      DateTime.utc(2019, 1, 6),
    ],
  ),
  User(
    name: 'Jonah',
    role: 'Corretor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Stacyclever@facebook.com',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2021, 7, 20),
      DateTime.utc(2021, 8, 29),
      DateTime.utc(2021, 1, 6),
    ],
  ),
  User(
    name: 'Kimberley',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Robertoagreeable@windstream.net',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2022, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2022, 1, 6),
    ],
  ),
  User(
    name: 'Waldo',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Sandrablushing@bluewin.ch',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2021, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Garret',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 05, 5),
    email: 'selfishTroy36@outlook.com',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Margaret',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Randalltame@tiscali.co.uk',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Foster',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 12, 30),
    email: 'dangerousSuzanne0@hotmail.fr',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Samuel',
    role: 'Tutor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'aggressiveEdwin16@mail.com',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Sam',
    role: 'Corretor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Laceyaverage@hotmail.it',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
  User(
    name: 'Alise',
    role: 'Monitor',
    dtUpdated: DateTime.utc(2022, 11, 12),
    email: 'Claytonblack@hotmail.co.uk',
    cellphone: '119588126495',
    course: 'Engenharia da computação',
    hoursWorked: 16,
    university: 'Unicamp',
    listActivities: [
      Activity(
          hoursWorked: 16,
          description: "aaaaaaaaa",
          feedback: "dsvdvf",
          date: DateTime.utc(2020, 12, 01)),
      Activity(
          hoursWorked: 19,
          description: "fvfdvdfv",
          feedback: "dvdfvdfderv",
          date: DateTime.utc(2022, 12, 01)),
    ],
    pendencies: [
      DateTime.utc(2020, 7, 20),
      DateTime.utc(2022, 8, 29),
      DateTime.utc(2023, 1, 6),
    ],
  ),
];
