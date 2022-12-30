import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/theme/theme_managment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtility.GeneralAppPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUtility.GeneralSpace,
          const Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: _SmallText(title: "Account")),
          const Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: _ListTile(
              icon: Icons.person_outline_rounded,
              circleBackgroundColor: Color(0xfff4f4f5), 
            iconColor: Color(0xffb7bbc8),title: "Görkem Arslanboğan", subTitle: "Yönetici"),
          ),
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _SmallText(title: "Settings")),
            AppUtility.GeneralSpace,
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: _ListTile(
              circleBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
              trailingWidget: const goButton(),
              iconColor:  Theme.of(context).colorScheme.onPrimaryContainer,
              title: "Language", icon:Icons.language_sharp ,),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: _ListTile(
                  icon: Icons.dark_mode,
                  circleBackgroundColor:Theme.of(context).colorScheme.primary,
                   iconColor: Theme.of(context).colorScheme.onPrimary,
                   title: "Dark Mode",
                   trailingWidget: Switch(
                    value: context.watch<theme_provider>().isLight, onChanged: (bool){
                    context.read<theme_provider>().changeTheme();
                   }),),
            ),
          Flexible(
            flex: 2,
            child: _ListTile(
              icon: Icons.help_sharp,
              circleBackgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              iconColor: Theme.of(context).colorScheme.onSecondaryContainer,
              title: "Help",
              trailingWidget: const goButton(),)),
        ],
      ),
    );
  }
}


class _SmallText extends StatelessWidget {
  const _SmallText({
    Key? key, required this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(
      fontWeight: FontWeight.w300,
      color: Theme.of(context).colorScheme.onBackground,
    ),);
  }
}


class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key, required this.circleBackgroundColor, required this.iconColor, required this.title, this.subTitle, this.trailingWidget, required this.icon,
  }) : super(key: key);
  final Color? circleBackgroundColor;
  final Color? iconColor;
  final IconData icon;
  final String title;
  final String? subTitle;
  final Widget? trailingWidget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  SizedBox(
        height: 60,
        width: 60,
        child: CircleAvatar(
          backgroundColor: circleBackgroundColor,
          child: Icon(icon, color: iconColor,size: 30,),
          )),
          title: Text(title, style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.w300,
          color: Theme.of(context).colorScheme.onBackground,
    ),),
          subtitle: (subTitle == null) ? null : Text(subTitle!,style: TextStyle(color: Theme.of(context).colorScheme.onBackground,),),
          trailing: trailingWidget,
          );
  }
}
class goButton extends StatelessWidget {
  const goButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: const Icon(Icons.navigate_next_rounded),);
  }
}