import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconData? icon;
  final bool? isLeadingIcon;
  final bool? isCenterTitle;
  final bool? isTransparentAppBar;

  const CustomAppBar({super.key, required this.title,this.icon,this.isLeadingIcon,this.isCenterTitle, this.isTransparentAppBar});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: isLeadingIcon!,
      forceMaterialTransparency: isTransparentAppBar!,
      leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Row(
        mainAxisAlignment: isCenterTitle! ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          icon != null ? Icon(icon) : const SizedBox(width: 10,),
          const SizedBox(width: 10,),
          Text(title,style: const TextStyle(
              fontFamily: 'SatoshiBold'
          ),)
        ],
      ),
    );
  }
}
