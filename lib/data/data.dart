// ignore_for_file: prefer_const_constructors
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import '../utils/theme.dart';

class Data {
  static List<KColumn> getColumns() {
    var uuid = Uuid();
    return List.from([
      KColumn(
        title: 'To Do',
        children: [
          KTask(
              id: uuid.v4(),
              title: 'Get gas',
              description: '200 miles until empty',
              themeColor: lightBlue),
          KTask(
              id: uuid.v4(),
              title: 'Prepare for BBQ',
              description: 'What is needed?',
              themeColor: lightYellow),
          KTask(
              id: uuid.v4(),
              title: 'Go swimming',
              description: 'You are on vacation',
              themeColor: lightOrange),
          KTask(
              id: uuid.v4(),
              title: 'Get some sleep',
              description: 'You need it.',
              themeColor: lightGreen),
        ],
      ),
      KColumn(
        title: 'In Progress',
        children: [
          KTask(
              id: uuid.v4(),
              title: 'Continue packing',
              description: 'Move stuff to basement',
              themeColor: lightPink),
        ],
      ),
      KColumn(
        title: 'Done',
        children: [
          KTask(
              id: uuid.v4(),
              title: 'Drive CA to FL',
              description: 'Repeat soon',
              themeColor: lightOrange),
          KTask(
              id: uuid.v4(),
              title: 'Paint garage',
              description: 'What color?',
              themeColor: lightBlue),
        ],
      )
    ]);
  }
}
