// import 'dart:ffi';

import 'package:flutter/material.dart';

abstract class _Constants {
  static const double iconSize = 30;
  static const double itemSpacing = 20;
  static const double badgeSize = 15;
}

//BUTTONS LOCATION CLASS
class ActivitiesWidget extends StatelessWidget {
  const ActivitiesWidget(int currentActive, {super.key,required this.activities});

  final Map<ActivityType, ActivityQuality> activities;

  //CREATE ROW WITH EVENLY-SPACED OPTIONS
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: _buildActivities());

  //CREATES ITEM SPACING
  Widget _buildSpacing() =>  const SizedBox(
        width: _Constants.itemSpacing - _Constants.badgeSize / 2);

  //CREATE BUTTONS
  List<Widget> _buildActivities() {
    List<Widget> widgets = [const SizedBox(width: _Constants.itemSpacing)];
    //assign each an activity and a type
    activities.forEach((activityType, activityQuality) {
      widgets
        ..add(
          ActivityWidget(
            activityType: activityType,
            activityQuality: activityQuality,
          ),
        )
        ..add(_buildSpacing());
    });

    return widgets;
  }
}

//buttons name and notification-active
enum ActivityType { buses, hours, places }
enum HoverType {hover, notHover}
enum ActivityActive {active, notActive}
enum ActivityQuality { good, bad }

//BUTTONS DISPLAY CLASS
class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key, required this.activityType, required this.activityQuality});

  //final HoverType isOnHover = isHover();
  final ActivityType activityType ;
  final ActivityQuality activityQuality;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Stack( //notification overlap on button
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: _Constants.badgeSize / 2,
                right: _Constants.badgeSize / 2,
              ),
              //load visuals
              child: _buildActivityContainer(
                context,
                _imageForActivityType(activityType),
                _titleForActivityType(activityType),
              ),
            ),
            //notification warnings
            Positioned( //warning offsets
              right: 0,
              top: 0,
              child: _buildWarningBadge(activityQuality),
            ),
          ],
        ),
      );
  //BUTTON VISUALS WIDGET
  Widget _buildActivityContainer(
    BuildContext context,
    Image activityIcon,
    String title,
  ) =>
      Container(
        decoration: BoxDecoration(
          //color: _buttonBackgroundColor(onHover),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(60),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Center(
            child: _buildActivityColumn(context, activityIcon, title),
          ),
        ),
      );

  Widget _buildActivityColumn(
    BuildContext context,
    Image activityIcon,
    String title,
  ) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: _Constants.iconSize,
            height: _Constants.iconSize,
            child: activityIcon,
          ),
          const SizedBox(height: 10),
          Opacity(
            opacity: 0.75,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );

  //load button notification-active
  Widget _buildWarningBadge(ActivityQuality quality) {
    switch (quality) {
      case ActivityQuality.good:
        return Container();
      case ActivityQuality.bad:
        return Container(
          width: _Constants.badgeSize,
          height: _Constants.badgeSize,
          child: Image.asset("assets/images/icon_warning.png"),
        );
    }
  }

  //load button icon
  Image _imageForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.buses:
        return Image.asset("assets/images/bus_icon.png");
      case ActivityType.hours:
        return Image.asset("assets/images/time-icon.png");
      case ActivityType.places:
        return Image.asset("assets/images/tree-icon.png");
    }
  }

  //load button text
  String _titleForActivityType(ActivityType activityType) {
    switch (activityType) {
      case ActivityType.buses:
        return "Buses";
      case ActivityType.hours:
        return "Hours";
      case ActivityType.places:
        return "Places";
      default:
        return "";
    }
  }

  Color _buttonBackgroundColor(HoverType hoverType) {
    switch(hoverType) {
      case HoverType.hover:
        return const Color.fromRGBO(210, 210, 210, 1);
      case HoverType.notHover:
        return const Color.fromRGBO(255, 255, 255, 1);
    }
  }
}