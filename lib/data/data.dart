// ignore_for_file: prefer_const_constructors

import '../models/models.dart';
import '../utils/theme.dart';

class Data {
  static List<KColumn> getColumns() {
    return List.from([
      KColumn(
        title: 'To Do',
        children: [
          KTask(
              title: 'Get gas',
              description: '200 miles until empty',
              themeColor: lightBlue),
          KTask(
              title: 'Prepare for BBQ',
              description: 'What is needed?',
              themeColor: lightYellow),
          KTask(
              title: 'Go swimming',
              description: 'You are on vacation',
              themeColor: lightOrange),
          KTask(
              title: 'Get some sleep',
              description: 'You need it.',
              themeColor: lightGreen),
        ],
      ),
      KColumn(
        title: 'In Progress',
        children: [
          KTask(
              title: 'Continue packing',
              description: 'Move stuff to basement',
              themeColor: lightPink),
        ],
      ),
      KColumn(
        title: 'Done',
        children: [
          KTask(
              title: 'Drive CA to FL',
              description: 'Repeat soon',
              themeColor: lightOrange),
          KTask(
              title: 'Paint garage',
              description: 'What color?',
              themeColor: lightBlue),
        ],
      )
    ]);
  }
}
