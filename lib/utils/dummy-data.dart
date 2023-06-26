import 'package:villasara_front_end/model/entity/contract.dart';
import 'package:villasara_front_end/model/entity/person.dart';
import 'package:villasara_front_end/model/entity/villa.dart';

import 'constants.dart';

List<Person> dymmyPerson = [
  Person(id: 1,phone_number: "091325324", role: host,),
  Person(id: 11,phone_number: "091325324", role: guest,),
  Person(id: 12,phone_number: "091325362", role: guest,),
  Person(id: 13,phone_number: "091325334", role: guest,),
];
List dummyVilla = [
  Villa(
    id: 1,
    villaOwner: 1,
    name: "ویلای شیک",
    state: 3,
    region: "ناحیه 4",
    city: "ساری",
    address: "خیابان کوچک جنگلی",
    images: [
      "", "", "",
    ],
    description: "سه خوابه - حمام",
    pricePerNight: 3000,
  ),
  Villa(
    id: 2,
    villaOwner: 1,
    name: "ویلای زیبا",
    state: 3,
    region: "ناحیه 3",
    city: "رامسر",
    address: "خیابان ساری",
    images: [
      "", "", "",
    ],
    description: "دو خوابه",
    pricePerNight: 2000,
  ),
  Villa(
    id: 3,
    villaOwner: 1,
    name: "ویلای خاص",
    state: 4,
    region: "ناحیه 5",
    city: "آستارا",
    address: "فرعی دوم",
    images: [
      "", "", "",
    ],
    description: "استخر دار",
    pricePerNight: 4000,
  ),
];

List dummyContract = [
  Contract(
    id: 1,
    villaOwner: 1,
    villa: 1,
    tenant: 11,
    totalPrice: 1000000,
    peopleCount: 4,
    startDate: "1402-04-07",
    endDate: "1402-04-14",
  ),
  Contract(
    id: 2,
    villaOwner: 1,
    villa: 2,
    tenant: 12,
    totalPrice: 2000000,
    peopleCount: 3,
    startDate: "1402-05-07",
    endDate: "1402-05-14",
  ),
  Contract(
    id: 3,
    villaOwner: 1,
    villa: 3,
    tenant: 13,
    totalPrice: 3000000,
    peopleCount: 2,
    startDate: "1402-06-07",
    endDate: "1402-06-14",
  ),
];
