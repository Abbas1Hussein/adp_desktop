import 'package:adp_desktop/adp_desktop.dart';

import '../../../../../utils/highlight_paths.dart';
import '../../../../widgets/display_button.dart';
import '../../../../widgets/title.dart';
import 'text_field.dart';
import 'text_form_field.dart';
import 'text_search_field.dart';

class Fields extends StatelessWidget {
  const Fields({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTitle(
          path: HighlightPaths.textField,
          title: 'Text Field',
          message:
              'AdaptiveTextField: A simple text input field that adapts its appearance based on the platform. Use this widget when you need a basic text input field without any validation.',
        ),
        DisplayNavButton(child: TextFieldPreview()),
        CustomTitle(
          path: HighlightPaths.textFormField,
          title: 'Text Form Field',
          message:
              'AdaptiveTextFormField: A text input field wrapped in a Form widget, allowing you to easily validate user input. Use this widget when you need to validate user input, such as for login forms or data entry forms.',
        ),
        DisplayNavButton(child: TextFormFieldPreview()),
        CustomTitle(
          path: HighlightPaths.textSearchField,
          title: 'Text Search Field',
          message:
              'AdaptiveTextSearchField: A text input field specifically designed for search functionality. It provides suggestions and options to refine search queries, making it ideal for search bars or filtering functionality.',
        ),
        DisplayNavButton(child: TextSearchFieldPreview()),
      ],
    );
  }
}
