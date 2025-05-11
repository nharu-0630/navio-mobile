import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';

part 'circle_info.freezed.dart';

@freezed
abstract class CircleInfo with _$CircleInfo {
  const factory CircleInfo({
    required String circleID,
    required String space,
    required String artifactTitle,
    required String artifactTendency,
    required String nameKana,
    required String name,
    @Default('') String penName,
    required bool isManga,
    required bool isNovel,
    required bool isR18,
    @Default('') String homepageURL,
    @Default('') String twitterURL,
    @Default('') String pixivURL,
    @Default('') String imageURL,
  }) = _CircleInfo;

  factory CircleInfo.fromHTML(String html) {
    final document = parse(html);
    final item = document.querySelector('.WebpamphletCircleInfo');
    if (item == null) {
      throw Exception('Circle info not found');
    }

    final circleId =
        item
            .querySelector('input[name="selected_circle_id"]')
            ?.attributes['value'] ??
        '';
    final space = item.querySelector('.CircleSpace')?.text ?? '';
    final artifactTitle = item.querySelector('.ArtifactTitle')?.text ?? '';
    final artifactTendency =
        item.querySelector('.ArtifactTendency')?.text ?? '';
    final nameKana = item.querySelector('.CircleNameKana')?.text ?? '';
    final name = item.querySelector('.CircleName')?.text ?? '';
    final penName = item.querySelector('.CirclePenname')?.text ?? '';

    final isManga = item.querySelector('.CircleIsManga')?.text == '1';
    final isNovel = item.querySelector('.CircleIsNovel')?.text == '1';
    final isR18 = item.querySelector('.CircleR18')?.text == '1';

    String homepageURL = '';
    String twitterURL = '';
    String pixivURL = '';

    final links = item.querySelectorAll('.circle_link_button');
    for (final link in links) {
      final href = link.attributes['href'] ?? '';
      final linkHtml = link.outerHtml;

      if (linkHtml.contains('icon-homepage')) {
        homepageURL = href;
      } else if (linkHtml.contains('icon-twitter')) {
        twitterURL = href;
      } else if (linkHtml.contains('icon-pixiv')) {
        pixivURL = href;
      }
    }

    final imageURL = item.querySelector('.CircleCut')?.attributes['src'] ?? '';

    return CircleInfo(
      circleID: circleId,
      space: space,
      artifactTitle: artifactTitle,
      artifactTendency: artifactTendency,
      nameKana: nameKana,
      name: name,
      penName: penName,
      isManga: isManga,
      isNovel: isNovel,
      isR18: isR18,
      homepageURL: homepageURL,
      twitterURL: twitterURL,
      pixivURL: pixivURL,
      imageURL: imageURL,
    );
  }
}
