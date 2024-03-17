import 'dart:async';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:simple_components/common/overlays/middle_filter_left_overlay.dart';

class CheckBoxSideText extends StatelessWidget {
  const CheckBoxSideText({
    super.key,
    required this.text,
    required this.onChanged,
    required this.value,
  });

  final bool? value;
  final void Function(bool?)? onChanged;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(text), Checkbox(value: value, onChanged: onChanged)],
    );
  }
}

class SettingsTextField extends StatelessWidget {
  const SettingsTextField(
      {super.key,
      this.maxline,
      required this.controller,
      required this.fieldname,
      this.validator,
      this.icon,
      this.onchaged,
      this.readonly,
      this.decoration,
      this.ontap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.inititalValue,
      this.hidefieldname,
      this.hintText

      // this.obscure,
      // this.showSuffix
      });

  final String fieldname;
  final String? inititalValue;
  final TextEditingController controller;
  final int? maxline;
  final String? Function(String?)? validator;
  final Icon? icon;
  final void Function(String)? onchaged;
  final bool? readonly;
  final InputDecoration? decoration;
  final void Function()? ontap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final bool? hidefieldname;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hidefieldname == null
              ? Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    fieldname,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: hidefieldname == null ? 10 : 10,
          ),
          TextFormField(
            initialValue: inititalValue,
            onEditingComplete: onEditingComplete,
            onTap: ontap,
            textAlignVertical: TextAlignVertical.center,
            // obscureText: obscure ?? false,
            onChanged: onchaged,
            validator: validator,
            maxLines: maxline ?? 1,
            readOnly: readonly ?? false,
            // maxLength: maxline,
            onFieldSubmitted: onFieldSubmitted,
            controller: controller,
            decoration: decoration ??
                InputDecoration(
                    hintText: hintText,
                    // suffixIcon:
                    //g showSuffix == true
                    //     ? IconButton(
                    //         onPressed: () {},
                    //         icon: obscure!
                    //             ? Icon(Icons.visibility_off)
                    //             : Icon(Icons.visibility))
                    //     : null,
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    ));
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      this.maxline,
      required this.controller,
      required this.fieldname,
      this.validator,
      this.icon,
      this.obscure,
      this.showSuffix});

  final String fieldname;
  final TextEditingController controller;
  final int? maxline;
  final String? Function(String?)? validator;
  final Icon? icon;
  final bool? obscure;
  final bool? showSuffix;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              widget.fieldname,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: obscure,
            validator: widget.validator,
            maxLines: widget.maxline ?? 1,
            // maxLength: maxline,
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: widget.showSuffix == true
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            if (obscure) {
                              obscure = false;
                            } else {
                              obscure = true;
                            }
                          });
                        },
                        icon: widget.showSuffix == true && obscure == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))
                    : null,
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    ));
  }
}

class SettingsDropDownMenu extends StatelessWidget {
  const SettingsDropDownMenu(
      {super.key,
      this.maxline,
      required this.controller,
      required this.fieldname,
      this.validator,
      this.icon,
      this.onchaged,
      required this.dropdownMenuEntries,
      this.width,
      this.initialvalue
      // this.obscure,
      // this.showSuffix
      });

  final String fieldname;
  final TextEditingController controller;
  final int? maxline;
  final String? Function(String?)? validator;
  final Icon? icon;
  final void Function(String?)? onchaged;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final double? width;
  final String? initialvalue;
  // final bool? obscure;
  // final bool? showSuffix;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                fieldname,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownMenu<String>(
              expandedInsets: const EdgeInsets.all(5),
              initialSelection: initialvalue,
              dropdownMenuEntries: [
                ...dropdownMenuEntries,
              ],
              //  width: width,
              // obscureText: obscure ?? false,
              onSelected: onchaged,

              // maxLength: maxline,
              controller: controller,
              inputDecorationTheme: InputDecorationTheme(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}

Widget titleAndAnswer(String heading, String answer, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(answer),
      ],
    ),
  );
}

class TextCheckBox extends StatelessWidget {
  const TextCheckBox(
      {super.key,
      required this.text,
      required this.value,
      this.onChanged,
      this.showleft});

  final String text;
  final bool value;
  final bool? showleft;

  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        showleft != null
            ? Checkbox(splashRadius: 1, value: value, onChanged: onChanged)
            : const SizedBox(),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          width: 5,
        ),
        showleft == null
            ? Checkbox(splashRadius: 1, value: value, onChanged: onChanged)
            : const SizedBox()
      ]),
    );
  }
}

class CustomSegmentedTextField<T> extends ConsumerStatefulWidget {
  const CustomSegmentedTextField({
     this.onEditingComplete,
    required this.showSegButtons,
    required this.showSearch,
    this.onChanged,
    this.segOnSelectionChanged,
    this.setIndex,
    this.text,
    this.segLabel1,
    this.segLabel2,
    required this.suggestionsCallback,
    required this.itemBuilder,
    this.onSelected,
    required this.typeName,
    required this.controller,
    this.showtoptext,
    this.segAtLast,
    this.segAtStart,
    this.width,
    this.hintText,
    super.key,
  });
  final bool showSearch;
  final bool showSegButtons;
  final TextEditingController controller;

  //** seg values */
  final bool? segAtLast;
  final bool? segAtStart;
  final String? segLabel1;
  final String? segLabel2;
  final void Function(String)? onChanged;
  final void Function(Set<bool>)? segOnSelectionChanged;
  final Set<bool>? setIndex;
  //** search values */
  final String? text;
  final bool? showtoptext;
  final FutureOr<List<T>> Function(String)? suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T)? onSelected;
  final String typeName;
  final double? width;
  final String? hintText;
  final void Function()? onEditingComplete;

  // Sale sale;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomSegmentedTextFieldState<T>();
}

class _CustomSegmentedTextFieldState<T>
    extends ConsumerState<CustomSegmentedTextField<T>> {
  // TextEditingController salediscountcontroller = TextEditingController();

  var suggestionController = SuggestionsController<T>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // salediscountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration? decoration = InputDecoration(
      // border:
      //     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintText: widget.hintText,
      border: widget.showSegButtons
          ? OutlineInputBorder(
              borderRadius: widget.segAtStart == true
                  ? const BorderRadius.only(
                      // bottomRight: Radius.circular(10),
                      // topRight: Radius.circular(10),
                      )
                  : widget.segAtLast == true
                      ? const BorderRadius.only(
                          // bottomLeft: Radius.circular(10),
                          // topLeft: Radius.circular(10),
                          )
                      : BorderRadius.circular(10),
            )
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    );
    var s = TypeAheadField<T>(
      // decorationBuilder: (context, child) {
      //   return Card(

      //     child: child,);
      // },

      controller: widget.controller,
      suggestionsCallback: widget.suggestionsCallback ??
          (se) {
            return [];
          },
      builder: (context, controller, focusNode) {
        return SizedBox(
          height: 40,
          child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              focusNode: focusNode,
              decoration: decoration),
        );
      },
      // loadingBuilder: (context) {
      //   // return Container(
      //   //   height: 100,
      //   //   child: Center(
      //   //     child: CircularProgressIndicator.adaptive(),
      //   //   ),
      //   // );
      // },
      itemBuilder: widget.itemBuilder,
      onSelected: widget.onSelected,
      emptyBuilder: (context) {
        return const ListTile(
          title: Text('No product found'),
        );
        // TextButton(
        //   onPressed: () {},
        //   child: Text('Add ${widget.typeName}'),
        // );
      },
      suggestionsController: suggestionController,
    );
    var c = SizedBox(
      height: 40,
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        onEditingComplete:  widget.onEditingComplete,
        decoration: decoration,
      ),
    );

    var b = SegmentedButton(
      showSelectedIcon: false,
      style: ButtonStyle(
        alignment: Alignment.center,
        // padding: const MaterialStatePropertyAll(

        //     EdgeInsets.symmetric(vertical: 15)),
        // padding: MaterialStatePropertyAll(EdgeInsets.all(4)),
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
        shape: MaterialStatePropertyAll(
          ContinuousRectangleBorder(
            //15
            borderRadius: widget.segAtLast == true
                ? const BorderRadius.only(
                    bottomRight: Radius.circular(0),
                    topRight: Radius.circular(0),
                  )
                : widget.segAtStart == true
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                      )
                    : BorderRadius.circular(10),
          ),
        ),
      ),
      onSelectionChanged: widget.segOnSelectionChanged,
      selected: widget.setIndex ?? {false},
      segments: const [
        ButtonSegment(
          enabled: true, value: false,
          icon: Icon(Icons.search),
          //  label: Text('  ${widget.segLabel1}  ')
        ),
        ButtonSegment(
          enabled: true,
          value: true,
          icon: Icon(Icons.qr_code),
          // label: Text('  ${widget.segLabel2}  ')
        ),
      ],
    );

    return Container(
      height: widget.showtoptext == true ? 80 : 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showtoptext == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    widget.typeName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: widget.showtoptext == true ? 10 : 0,
          ),
          Row(
            children: [
              widget.showSegButtons && widget.segAtStart == true
                  ? SizedBox(width: 115, height: 39, child: b)
                  : const SizedBox(),
              Expanded(
                child: widget.showSearch && widget.setIndex?.first == false   ? s : c,
              ),
              widget.showSegButtons && widget.segAtLast == true
                  ? SizedBox(width: 115, height: 39, child: b)
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class TextFieldSideText extends StatelessWidget {
  const TextFieldSideText(
      {super.key,
      required this.text,
      this.onChanged,
      this.fieldWidth,
      this.textWidth,
      // required this.value,
      required this.controller});

  // final bool? value;
  final double? textWidth;
  final double? fieldWidth;
  final void Function(String?)? onChanged;
  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: textWidth,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: fieldWidth,
          child: Row(
            children: [
              SimpletextField(
                onchaged: onChanged,
                controller: controller,
              ),
            ],
          ),
        )
        // Flexible(
        //   child: TextField(
        //       controller: controller,
        //       decoration: InputDecoration(
        //         contentPadding: const EdgeInsets.all(10),
        //         border:
        //             OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        //       )),
        // )
      ],
    );
  }
}

customFilterchips({required BuildContext context, required String label}) {
  return Chip(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    label: Text(label),
    deleteIcon: const Icon(
      Icons.cancel_outlined,
      size: 14,
    ),
    onDeleted: () {},
    color: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.secondaryContainer),
  );
}

class CustomDateDropdown extends ConsumerStatefulWidget {
  const CustomDateDropdown(
      {super.key, required this.onValueChanged, required this.selecteddate});

  final void Function(List<DateTime?>)? onValueChanged;
  final DateTime selecteddate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDateDropdownState();
}

class _CustomDateDropdownState extends ConsumerState<CustomDateDropdown> {
  var dateController = TextEditingController();
  var selecteddate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: MiddleFilterLeftOverlay(
            controller: dateController,
            label: const Text(''),
            width: 170,
            child: SizedBox(
                width: 300,
                height: 280,
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.single,
                  ),
                  value: [widget.selecteddate],
                  onValueChanged: widget.onValueChanged,
                )),
          ),
        ),
      ],
    );
  }
}

class SimpletextField extends StatelessWidget {
  const SimpletextField(
      {super.key,
      required this.onchaged,
      required this.controller,
      this.onTap,
      this.hintText});

  final void Function(String)? onchaged;
  final TextEditingController controller;
  final String? hintText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 35,
        child: TextFormField(
          controller: controller,
          onTap: onTap,
          readOnly: onTap != null ? true : false,
          cursorHeight: 20,
          style: const TextStyle(fontSize: 15),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.only(
                top: 14, left: 4), // Adjust the height of the cursor
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
