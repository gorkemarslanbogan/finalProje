import 'package:final_project/core/widget/loading_bar.dart';
import 'package:final_project/product/utils/app_utilts.dart';
import 'package:final_project/product/widget/medium_text_widget.dart';
import 'package:final_project/product/widget/textfield.dart';
import 'package:final_project/view/screen/mainscreen.dart';
import 'package:final_project/viewmodel/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return _LoginBody(height: height);
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: height*0.94,
       child: SingleChildScrollView(
        physics: const PageScrollPhysics(),
       child: SizedBox( 
         height: height,
         child: Padding(
           padding: AppUtility.GeneralAppPadding,
           child: _ColumnItem(height: height),
         ),
       ),
        ),
      );
  }
}

class _ColumnItem extends StatelessWidget {
  const _ColumnItem({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       SizedBox(
        height: height*0.45,
        child:  Lottie.asset(AppUtility.SPLAHS_SCREEN_PATH,fit: BoxFit.contain),
      ),
     const Flexible(
        flex: 2,
        child:  mediumText(title: "Welcome to Stock Manager!")),
      AppUtility.GeneralSpace,
     const Flexible(
        flex: 2,
        child:  CustomtextField(hintText: "E-mail", inputType: TextInputType.emailAddress, icon: Icon(Icons.mail, color: Colors.grey,))),
      AppUtility.GeneralSpace,
      const Flexible(
        flex: 2,
        child: CustomtextField(hintText: "Password", inputType: TextInputType.visiblePassword, icon: Icon(Icons.visibility, color: Colors.grey,))),
      AppUtility.GeneralSpace,
      context.watch<HomeScreenProvider>().isLoading ?   
      Flexible(flex: 3, child: LoadingBar()) : const _LoginButton(),
    ],
     );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
       style: OutlinedButton.styleFrom(
         backgroundColor: Theme.of(context).colorScheme.onPrimary,
         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))
       ),
      onPressed:() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
       },
      child:  Padding(
      padding:const EdgeInsets.symmetric(horizontal:18, vertical: 15),
      child: Text("Sign In", style: Theme.of(context).textTheme.headline6?.copyWith(
       color: Theme.of(context).colorScheme.background,
       fontWeight: FontWeight.w400
      ),),
       )),
    );
  }
}
