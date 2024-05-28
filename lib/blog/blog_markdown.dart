import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogMarkdown extends StatelessWidget {
  final String markdown;
  const BlogMarkdown({
    super.key,
    required this.markdown,
  });

  @override
  Widget build(BuildContext context) {
    // adding personal markdown styling
    return GestureDetector(
      onTap: (text){
        _launchURL(text);
      },
      child: Markdown(
        data: markdown,
        selectable: true,
        // allows custom styling of the markdown
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          h1: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 20,
          ),
          h2: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 18,
          ),
          h3: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          h4: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 14,
          ),
          h5: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 12,
          ),
          h6: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 10,
          ),
          blockquote: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          code: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          em: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          strong: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          del: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          listBullet: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          tableHead: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          tableBody: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 16,
          ),
          tableHeadAlign: TextAlign.center,
          tableBorder: TableBorder.all(
            color: Colors.black,
            width: 1.0,
          ),
          blockSpacing: 16,
          listIndent: 16,
          blockquotePadding: const EdgeInsets.all(16),
          blockquoteDecoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          blockquoteAlign: WrapAlignment.start,
        ),
      ),
    );
  }


}

  void _launchURL(String text) async {
  if (await canLaunchUrl(Uri.parse(text))) {
    await launchUrl(Uri.parse(text));
  } else {
    // Handle invalid URL (optional)
    //print('Could not launch $text');
  }
}
