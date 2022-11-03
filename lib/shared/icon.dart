import 'package:flutter_svg/svg.dart';
import 'package:god_life/shared/shared.dart';

enum IconType {
  home,
  homeOrange,
  exercise,
  exerciseOrange,
  calendar,
  calendarOrange,
  chat,
  chatOrange
}

final svgIcon = {
  IconType.home: SvgPicture.asset('assets/icons/home.svg'),
  IconType.homeOrange: SvgPicture.asset(
    'assets/icons/home.svg',
    color: customColor[ColorType.orange],
  ),
  IconType.exercise: SvgPicture.asset('assets/icons/exercise.svg'),
  IconType.exerciseOrange: SvgPicture.asset(
    'assets/icons/exercise.svg',
    color: customColor[ColorType.orange],
  ),
  IconType.calendar: SvgPicture.asset('assets/icons/calendar.svg'),
  IconType.calendarOrange: SvgPicture.asset(
    'assets/icons/calendar.svg',
    color: customColor[ColorType.orange],
  ),
  IconType.chat: SvgPicture.asset('assets/icons/chat.svg'),
  IconType.chatOrange: SvgPicture.asset(
    'assets/icons/chat.svg',
    color: customColor[ColorType.orange],
  ),
};
