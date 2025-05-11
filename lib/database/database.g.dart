// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CircleInfosTable extends CircleInfos
    with TableInfo<$CircleInfosTable, CircleInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CircleInfosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _circleIDMeta = const VerificationMeta(
    'circleID',
  );
  @override
  late final GeneratedColumn<String> circleID = GeneratedColumn<String>(
    'circle_i_d',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spaceMeta = const VerificationMeta('space');
  @override
  late final GeneratedColumn<String> space = GeneratedColumn<String>(
    'space',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artifactTitleMeta = const VerificationMeta(
    'artifactTitle',
  );
  @override
  late final GeneratedColumn<String> artifactTitle = GeneratedColumn<String>(
    'artifact_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _artifactTendencyMeta = const VerificationMeta(
    'artifactTendency',
  );
  @override
  late final GeneratedColumn<String> artifactTendency = GeneratedColumn<String>(
    'artifact_tendency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameKanaMeta = const VerificationMeta(
    'nameKana',
  );
  @override
  late final GeneratedColumn<String> nameKana = GeneratedColumn<String>(
    'name_kana',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _penNameMeta = const VerificationMeta(
    'penName',
  );
  @override
  late final GeneratedColumn<String> penName = GeneratedColumn<String>(
    'pen_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isMangaMeta = const VerificationMeta(
    'isManga',
  );
  @override
  late final GeneratedColumn<bool> isManga = GeneratedColumn<bool>(
    'is_manga',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_manga" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isNovelMeta = const VerificationMeta(
    'isNovel',
  );
  @override
  late final GeneratedColumn<bool> isNovel = GeneratedColumn<bool>(
    'is_novel',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_novel" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isR18Meta = const VerificationMeta('isR18');
  @override
  late final GeneratedColumn<bool> isR18 = GeneratedColumn<bool>(
    'is_r18',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_r18" IN (0, 1))',
    ),
  );
  static const VerificationMeta _homepageURLMeta = const VerificationMeta(
    'homepageURL',
  );
  @override
  late final GeneratedColumn<String> homepageURL = GeneratedColumn<String>(
    'homepage_u_r_l',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _twitterURLMeta = const VerificationMeta(
    'twitterURL',
  );
  @override
  late final GeneratedColumn<String> twitterURL = GeneratedColumn<String>(
    'twitter_u_r_l',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _pixivURLMeta = const VerificationMeta(
    'pixivURL',
  );
  @override
  late final GeneratedColumn<String> pixivURL = GeneratedColumn<String>(
    'pixiv_u_r_l',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _imageURLMeta = const VerificationMeta(
    'imageURL',
  );
  @override
  late final GeneratedColumn<String> imageURL = GeneratedColumn<String>(
    'image_u_r_l',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    circleID,
    space,
    artifactTitle,
    artifactTendency,
    nameKana,
    name,
    penName,
    isManga,
    isNovel,
    isR18,
    homepageURL,
    twitterURL,
    pixivURL,
    imageURL,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'circle_infos';
  @override
  VerificationContext validateIntegrity(
    Insertable<CircleInfo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('circle_i_d')) {
      context.handle(
        _circleIDMeta,
        circleID.isAcceptableOrUnknown(data['circle_i_d']!, _circleIDMeta),
      );
    } else if (isInserting) {
      context.missing(_circleIDMeta);
    }
    if (data.containsKey('space')) {
      context.handle(
        _spaceMeta,
        space.isAcceptableOrUnknown(data['space']!, _spaceMeta),
      );
    } else if (isInserting) {
      context.missing(_spaceMeta);
    }
    if (data.containsKey('artifact_title')) {
      context.handle(
        _artifactTitleMeta,
        artifactTitle.isAcceptableOrUnknown(
          data['artifact_title']!,
          _artifactTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_artifactTitleMeta);
    }
    if (data.containsKey('artifact_tendency')) {
      context.handle(
        _artifactTendencyMeta,
        artifactTendency.isAcceptableOrUnknown(
          data['artifact_tendency']!,
          _artifactTendencyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_artifactTendencyMeta);
    }
    if (data.containsKey('name_kana')) {
      context.handle(
        _nameKanaMeta,
        nameKana.isAcceptableOrUnknown(data['name_kana']!, _nameKanaMeta),
      );
    } else if (isInserting) {
      context.missing(_nameKanaMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pen_name')) {
      context.handle(
        _penNameMeta,
        penName.isAcceptableOrUnknown(data['pen_name']!, _penNameMeta),
      );
    }
    if (data.containsKey('is_manga')) {
      context.handle(
        _isMangaMeta,
        isManga.isAcceptableOrUnknown(data['is_manga']!, _isMangaMeta),
      );
    } else if (isInserting) {
      context.missing(_isMangaMeta);
    }
    if (data.containsKey('is_novel')) {
      context.handle(
        _isNovelMeta,
        isNovel.isAcceptableOrUnknown(data['is_novel']!, _isNovelMeta),
      );
    } else if (isInserting) {
      context.missing(_isNovelMeta);
    }
    if (data.containsKey('is_r18')) {
      context.handle(
        _isR18Meta,
        isR18.isAcceptableOrUnknown(data['is_r18']!, _isR18Meta),
      );
    } else if (isInserting) {
      context.missing(_isR18Meta);
    }
    if (data.containsKey('homepage_u_r_l')) {
      context.handle(
        _homepageURLMeta,
        homepageURL.isAcceptableOrUnknown(
          data['homepage_u_r_l']!,
          _homepageURLMeta,
        ),
      );
    }
    if (data.containsKey('twitter_u_r_l')) {
      context.handle(
        _twitterURLMeta,
        twitterURL.isAcceptableOrUnknown(
          data['twitter_u_r_l']!,
          _twitterURLMeta,
        ),
      );
    }
    if (data.containsKey('pixiv_u_r_l')) {
      context.handle(
        _pixivURLMeta,
        pixivURL.isAcceptableOrUnknown(data['pixiv_u_r_l']!, _pixivURLMeta),
      );
    }
    if (data.containsKey('image_u_r_l')) {
      context.handle(
        _imageURLMeta,
        imageURL.isAcceptableOrUnknown(data['image_u_r_l']!, _imageURLMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CircleInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CircleInfo(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      circleID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}circle_i_d'],
          )!,
      space:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}space'],
          )!,
      artifactTitle:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}artifact_title'],
          )!,
      artifactTendency:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}artifact_tendency'],
          )!,
      nameKana:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name_kana'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      penName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pen_name'],
          )!,
      isManga:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_manga'],
          )!,
      isNovel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_novel'],
          )!,
      isR18:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_r18'],
          )!,
      homepageURL:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}homepage_u_r_l'],
          )!,
      twitterURL:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}twitter_u_r_l'],
          )!,
      pixivURL:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}pixiv_u_r_l'],
          )!,
      imageURL:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_u_r_l'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
      updatedAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}updated_at'],
          )!,
    );
  }

  @override
  $CircleInfosTable createAlias(String alias) {
    return $CircleInfosTable(attachedDatabase, alias);
  }
}

class CircleInfo extends DataClass implements Insertable<CircleInfo> {
  final int id;
  final String circleID;
  final String space;
  final String artifactTitle;
  final String artifactTendency;
  final String nameKana;
  final String name;
  final String penName;
  final bool isManga;
  final bool isNovel;
  final bool isR18;
  final String homepageURL;
  final String twitterURL;
  final String pixivURL;
  final String imageURL;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CircleInfo({
    required this.id,
    required this.circleID,
    required this.space,
    required this.artifactTitle,
    required this.artifactTendency,
    required this.nameKana,
    required this.name,
    required this.penName,
    required this.isManga,
    required this.isNovel,
    required this.isR18,
    required this.homepageURL,
    required this.twitterURL,
    required this.pixivURL,
    required this.imageURL,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['circle_i_d'] = Variable<String>(circleID);
    map['space'] = Variable<String>(space);
    map['artifact_title'] = Variable<String>(artifactTitle);
    map['artifact_tendency'] = Variable<String>(artifactTendency);
    map['name_kana'] = Variable<String>(nameKana);
    map['name'] = Variable<String>(name);
    map['pen_name'] = Variable<String>(penName);
    map['is_manga'] = Variable<bool>(isManga);
    map['is_novel'] = Variable<bool>(isNovel);
    map['is_r18'] = Variable<bool>(isR18);
    map['homepage_u_r_l'] = Variable<String>(homepageURL);
    map['twitter_u_r_l'] = Variable<String>(twitterURL);
    map['pixiv_u_r_l'] = Variable<String>(pixivURL);
    map['image_u_r_l'] = Variable<String>(imageURL);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CircleInfosCompanion toCompanion(bool nullToAbsent) {
    return CircleInfosCompanion(
      id: Value(id),
      circleID: Value(circleID),
      space: Value(space),
      artifactTitle: Value(artifactTitle),
      artifactTendency: Value(artifactTendency),
      nameKana: Value(nameKana),
      name: Value(name),
      penName: Value(penName),
      isManga: Value(isManga),
      isNovel: Value(isNovel),
      isR18: Value(isR18),
      homepageURL: Value(homepageURL),
      twitterURL: Value(twitterURL),
      pixivURL: Value(pixivURL),
      imageURL: Value(imageURL),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CircleInfo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CircleInfo(
      id: serializer.fromJson<int>(json['id']),
      circleID: serializer.fromJson<String>(json['circleID']),
      space: serializer.fromJson<String>(json['space']),
      artifactTitle: serializer.fromJson<String>(json['artifactTitle']),
      artifactTendency: serializer.fromJson<String>(json['artifactTendency']),
      nameKana: serializer.fromJson<String>(json['nameKana']),
      name: serializer.fromJson<String>(json['name']),
      penName: serializer.fromJson<String>(json['penName']),
      isManga: serializer.fromJson<bool>(json['isManga']),
      isNovel: serializer.fromJson<bool>(json['isNovel']),
      isR18: serializer.fromJson<bool>(json['isR18']),
      homepageURL: serializer.fromJson<String>(json['homepageURL']),
      twitterURL: serializer.fromJson<String>(json['twitterURL']),
      pixivURL: serializer.fromJson<String>(json['pixivURL']),
      imageURL: serializer.fromJson<String>(json['imageURL']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'circleID': serializer.toJson<String>(circleID),
      'space': serializer.toJson<String>(space),
      'artifactTitle': serializer.toJson<String>(artifactTitle),
      'artifactTendency': serializer.toJson<String>(artifactTendency),
      'nameKana': serializer.toJson<String>(nameKana),
      'name': serializer.toJson<String>(name),
      'penName': serializer.toJson<String>(penName),
      'isManga': serializer.toJson<bool>(isManga),
      'isNovel': serializer.toJson<bool>(isNovel),
      'isR18': serializer.toJson<bool>(isR18),
      'homepageURL': serializer.toJson<String>(homepageURL),
      'twitterURL': serializer.toJson<String>(twitterURL),
      'pixivURL': serializer.toJson<String>(pixivURL),
      'imageURL': serializer.toJson<String>(imageURL),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CircleInfo copyWith({
    int? id,
    String? circleID,
    String? space,
    String? artifactTitle,
    String? artifactTendency,
    String? nameKana,
    String? name,
    String? penName,
    bool? isManga,
    bool? isNovel,
    bool? isR18,
    String? homepageURL,
    String? twitterURL,
    String? pixivURL,
    String? imageURL,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CircleInfo(
    id: id ?? this.id,
    circleID: circleID ?? this.circleID,
    space: space ?? this.space,
    artifactTitle: artifactTitle ?? this.artifactTitle,
    artifactTendency: artifactTendency ?? this.artifactTendency,
    nameKana: nameKana ?? this.nameKana,
    name: name ?? this.name,
    penName: penName ?? this.penName,
    isManga: isManga ?? this.isManga,
    isNovel: isNovel ?? this.isNovel,
    isR18: isR18 ?? this.isR18,
    homepageURL: homepageURL ?? this.homepageURL,
    twitterURL: twitterURL ?? this.twitterURL,
    pixivURL: pixivURL ?? this.pixivURL,
    imageURL: imageURL ?? this.imageURL,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CircleInfo copyWithCompanion(CircleInfosCompanion data) {
    return CircleInfo(
      id: data.id.present ? data.id.value : this.id,
      circleID: data.circleID.present ? data.circleID.value : this.circleID,
      space: data.space.present ? data.space.value : this.space,
      artifactTitle:
          data.artifactTitle.present
              ? data.artifactTitle.value
              : this.artifactTitle,
      artifactTendency:
          data.artifactTendency.present
              ? data.artifactTendency.value
              : this.artifactTendency,
      nameKana: data.nameKana.present ? data.nameKana.value : this.nameKana,
      name: data.name.present ? data.name.value : this.name,
      penName: data.penName.present ? data.penName.value : this.penName,
      isManga: data.isManga.present ? data.isManga.value : this.isManga,
      isNovel: data.isNovel.present ? data.isNovel.value : this.isNovel,
      isR18: data.isR18.present ? data.isR18.value : this.isR18,
      homepageURL:
          data.homepageURL.present ? data.homepageURL.value : this.homepageURL,
      twitterURL:
          data.twitterURL.present ? data.twitterURL.value : this.twitterURL,
      pixivURL: data.pixivURL.present ? data.pixivURL.value : this.pixivURL,
      imageURL: data.imageURL.present ? data.imageURL.value : this.imageURL,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CircleInfo(')
          ..write('id: $id, ')
          ..write('circleID: $circleID, ')
          ..write('space: $space, ')
          ..write('artifactTitle: $artifactTitle, ')
          ..write('artifactTendency: $artifactTendency, ')
          ..write('nameKana: $nameKana, ')
          ..write('name: $name, ')
          ..write('penName: $penName, ')
          ..write('isManga: $isManga, ')
          ..write('isNovel: $isNovel, ')
          ..write('isR18: $isR18, ')
          ..write('homepageURL: $homepageURL, ')
          ..write('twitterURL: $twitterURL, ')
          ..write('pixivURL: $pixivURL, ')
          ..write('imageURL: $imageURL, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    circleID,
    space,
    artifactTitle,
    artifactTendency,
    nameKana,
    name,
    penName,
    isManga,
    isNovel,
    isR18,
    homepageURL,
    twitterURL,
    pixivURL,
    imageURL,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CircleInfo &&
          other.id == this.id &&
          other.circleID == this.circleID &&
          other.space == this.space &&
          other.artifactTitle == this.artifactTitle &&
          other.artifactTendency == this.artifactTendency &&
          other.nameKana == this.nameKana &&
          other.name == this.name &&
          other.penName == this.penName &&
          other.isManga == this.isManga &&
          other.isNovel == this.isNovel &&
          other.isR18 == this.isR18 &&
          other.homepageURL == this.homepageURL &&
          other.twitterURL == this.twitterURL &&
          other.pixivURL == this.pixivURL &&
          other.imageURL == this.imageURL &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CircleInfosCompanion extends UpdateCompanion<CircleInfo> {
  final Value<int> id;
  final Value<String> circleID;
  final Value<String> space;
  final Value<String> artifactTitle;
  final Value<String> artifactTendency;
  final Value<String> nameKana;
  final Value<String> name;
  final Value<String> penName;
  final Value<bool> isManga;
  final Value<bool> isNovel;
  final Value<bool> isR18;
  final Value<String> homepageURL;
  final Value<String> twitterURL;
  final Value<String> pixivURL;
  final Value<String> imageURL;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CircleInfosCompanion({
    this.id = const Value.absent(),
    this.circleID = const Value.absent(),
    this.space = const Value.absent(),
    this.artifactTitle = const Value.absent(),
    this.artifactTendency = const Value.absent(),
    this.nameKana = const Value.absent(),
    this.name = const Value.absent(),
    this.penName = const Value.absent(),
    this.isManga = const Value.absent(),
    this.isNovel = const Value.absent(),
    this.isR18 = const Value.absent(),
    this.homepageURL = const Value.absent(),
    this.twitterURL = const Value.absent(),
    this.pixivURL = const Value.absent(),
    this.imageURL = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CircleInfosCompanion.insert({
    this.id = const Value.absent(),
    required String circleID,
    required String space,
    required String artifactTitle,
    required String artifactTendency,
    required String nameKana,
    required String name,
    this.penName = const Value.absent(),
    required bool isManga,
    required bool isNovel,
    required bool isR18,
    this.homepageURL = const Value.absent(),
    this.twitterURL = const Value.absent(),
    this.pixivURL = const Value.absent(),
    this.imageURL = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : circleID = Value(circleID),
       space = Value(space),
       artifactTitle = Value(artifactTitle),
       artifactTendency = Value(artifactTendency),
       nameKana = Value(nameKana),
       name = Value(name),
       isManga = Value(isManga),
       isNovel = Value(isNovel),
       isR18 = Value(isR18);
  static Insertable<CircleInfo> custom({
    Expression<int>? id,
    Expression<String>? circleID,
    Expression<String>? space,
    Expression<String>? artifactTitle,
    Expression<String>? artifactTendency,
    Expression<String>? nameKana,
    Expression<String>? name,
    Expression<String>? penName,
    Expression<bool>? isManga,
    Expression<bool>? isNovel,
    Expression<bool>? isR18,
    Expression<String>? homepageURL,
    Expression<String>? twitterURL,
    Expression<String>? pixivURL,
    Expression<String>? imageURL,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (circleID != null) 'circle_i_d': circleID,
      if (space != null) 'space': space,
      if (artifactTitle != null) 'artifact_title': artifactTitle,
      if (artifactTendency != null) 'artifact_tendency': artifactTendency,
      if (nameKana != null) 'name_kana': nameKana,
      if (name != null) 'name': name,
      if (penName != null) 'pen_name': penName,
      if (isManga != null) 'is_manga': isManga,
      if (isNovel != null) 'is_novel': isNovel,
      if (isR18 != null) 'is_r18': isR18,
      if (homepageURL != null) 'homepage_u_r_l': homepageURL,
      if (twitterURL != null) 'twitter_u_r_l': twitterURL,
      if (pixivURL != null) 'pixiv_u_r_l': pixivURL,
      if (imageURL != null) 'image_u_r_l': imageURL,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CircleInfosCompanion copyWith({
    Value<int>? id,
    Value<String>? circleID,
    Value<String>? space,
    Value<String>? artifactTitle,
    Value<String>? artifactTendency,
    Value<String>? nameKana,
    Value<String>? name,
    Value<String>? penName,
    Value<bool>? isManga,
    Value<bool>? isNovel,
    Value<bool>? isR18,
    Value<String>? homepageURL,
    Value<String>? twitterURL,
    Value<String>? pixivURL,
    Value<String>? imageURL,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CircleInfosCompanion(
      id: id ?? this.id,
      circleID: circleID ?? this.circleID,
      space: space ?? this.space,
      artifactTitle: artifactTitle ?? this.artifactTitle,
      artifactTendency: artifactTendency ?? this.artifactTendency,
      nameKana: nameKana ?? this.nameKana,
      name: name ?? this.name,
      penName: penName ?? this.penName,
      isManga: isManga ?? this.isManga,
      isNovel: isNovel ?? this.isNovel,
      isR18: isR18 ?? this.isR18,
      homepageURL: homepageURL ?? this.homepageURL,
      twitterURL: twitterURL ?? this.twitterURL,
      pixivURL: pixivURL ?? this.pixivURL,
      imageURL: imageURL ?? this.imageURL,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (circleID.present) {
      map['circle_i_d'] = Variable<String>(circleID.value);
    }
    if (space.present) {
      map['space'] = Variable<String>(space.value);
    }
    if (artifactTitle.present) {
      map['artifact_title'] = Variable<String>(artifactTitle.value);
    }
    if (artifactTendency.present) {
      map['artifact_tendency'] = Variable<String>(artifactTendency.value);
    }
    if (nameKana.present) {
      map['name_kana'] = Variable<String>(nameKana.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (penName.present) {
      map['pen_name'] = Variable<String>(penName.value);
    }
    if (isManga.present) {
      map['is_manga'] = Variable<bool>(isManga.value);
    }
    if (isNovel.present) {
      map['is_novel'] = Variable<bool>(isNovel.value);
    }
    if (isR18.present) {
      map['is_r18'] = Variable<bool>(isR18.value);
    }
    if (homepageURL.present) {
      map['homepage_u_r_l'] = Variable<String>(homepageURL.value);
    }
    if (twitterURL.present) {
      map['twitter_u_r_l'] = Variable<String>(twitterURL.value);
    }
    if (pixivURL.present) {
      map['pixiv_u_r_l'] = Variable<String>(pixivURL.value);
    }
    if (imageURL.present) {
      map['image_u_r_l'] = Variable<String>(imageURL.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CircleInfosCompanion(')
          ..write('id: $id, ')
          ..write('circleID: $circleID, ')
          ..write('space: $space, ')
          ..write('artifactTitle: $artifactTitle, ')
          ..write('artifactTendency: $artifactTendency, ')
          ..write('nameKana: $nameKana, ')
          ..write('name: $name, ')
          ..write('penName: $penName, ')
          ..write('isManga: $isManga, ')
          ..write('isNovel: $isNovel, ')
          ..write('isR18: $isR18, ')
          ..write('homepageURL: $homepageURL, ')
          ..write('twitterURL: $twitterURL, ')
          ..write('pixivURL: $pixivURL, ')
          ..write('imageURL: $imageURL, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CircleInfosTable circleInfos = $CircleInfosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [circleInfos];
}

typedef $$CircleInfosTableCreateCompanionBuilder =
    CircleInfosCompanion Function({
      Value<int> id,
      required String circleID,
      required String space,
      required String artifactTitle,
      required String artifactTendency,
      required String nameKana,
      required String name,
      Value<String> penName,
      required bool isManga,
      required bool isNovel,
      required bool isR18,
      Value<String> homepageURL,
      Value<String> twitterURL,
      Value<String> pixivURL,
      Value<String> imageURL,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CircleInfosTableUpdateCompanionBuilder =
    CircleInfosCompanion Function({
      Value<int> id,
      Value<String> circleID,
      Value<String> space,
      Value<String> artifactTitle,
      Value<String> artifactTendency,
      Value<String> nameKana,
      Value<String> name,
      Value<String> penName,
      Value<bool> isManga,
      Value<bool> isNovel,
      Value<bool> isR18,
      Value<String> homepageURL,
      Value<String> twitterURL,
      Value<String> pixivURL,
      Value<String> imageURL,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CircleInfosTableFilterComposer
    extends Composer<_$AppDatabase, $CircleInfosTable> {
  $$CircleInfosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get circleID => $composableBuilder(
    column: $table.circleID,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get space => $composableBuilder(
    column: $table.space,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artifactTitle => $composableBuilder(
    column: $table.artifactTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get artifactTendency => $composableBuilder(
    column: $table.artifactTendency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameKana => $composableBuilder(
    column: $table.nameKana,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get penName => $composableBuilder(
    column: $table.penName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isManga => $composableBuilder(
    column: $table.isManga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNovel => $composableBuilder(
    column: $table.isNovel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isR18 => $composableBuilder(
    column: $table.isR18,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get homepageURL => $composableBuilder(
    column: $table.homepageURL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get twitterURL => $composableBuilder(
    column: $table.twitterURL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pixivURL => $composableBuilder(
    column: $table.pixivURL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageURL => $composableBuilder(
    column: $table.imageURL,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CircleInfosTableOrderingComposer
    extends Composer<_$AppDatabase, $CircleInfosTable> {
  $$CircleInfosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get circleID => $composableBuilder(
    column: $table.circleID,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get space => $composableBuilder(
    column: $table.space,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artifactTitle => $composableBuilder(
    column: $table.artifactTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get artifactTendency => $composableBuilder(
    column: $table.artifactTendency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameKana => $composableBuilder(
    column: $table.nameKana,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get penName => $composableBuilder(
    column: $table.penName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isManga => $composableBuilder(
    column: $table.isManga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNovel => $composableBuilder(
    column: $table.isNovel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isR18 => $composableBuilder(
    column: $table.isR18,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get homepageURL => $composableBuilder(
    column: $table.homepageURL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get twitterURL => $composableBuilder(
    column: $table.twitterURL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pixivURL => $composableBuilder(
    column: $table.pixivURL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageURL => $composableBuilder(
    column: $table.imageURL,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CircleInfosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CircleInfosTable> {
  $$CircleInfosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get circleID =>
      $composableBuilder(column: $table.circleID, builder: (column) => column);

  GeneratedColumn<String> get space =>
      $composableBuilder(column: $table.space, builder: (column) => column);

  GeneratedColumn<String> get artifactTitle => $composableBuilder(
    column: $table.artifactTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get artifactTendency => $composableBuilder(
    column: $table.artifactTendency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nameKana =>
      $composableBuilder(column: $table.nameKana, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get penName =>
      $composableBuilder(column: $table.penName, builder: (column) => column);

  GeneratedColumn<bool> get isManga =>
      $composableBuilder(column: $table.isManga, builder: (column) => column);

  GeneratedColumn<bool> get isNovel =>
      $composableBuilder(column: $table.isNovel, builder: (column) => column);

  GeneratedColumn<bool> get isR18 =>
      $composableBuilder(column: $table.isR18, builder: (column) => column);

  GeneratedColumn<String> get homepageURL => $composableBuilder(
    column: $table.homepageURL,
    builder: (column) => column,
  );

  GeneratedColumn<String> get twitterURL => $composableBuilder(
    column: $table.twitterURL,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pixivURL =>
      $composableBuilder(column: $table.pixivURL, builder: (column) => column);

  GeneratedColumn<String> get imageURL =>
      $composableBuilder(column: $table.imageURL, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CircleInfosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CircleInfosTable,
          CircleInfo,
          $$CircleInfosTableFilterComposer,
          $$CircleInfosTableOrderingComposer,
          $$CircleInfosTableAnnotationComposer,
          $$CircleInfosTableCreateCompanionBuilder,
          $$CircleInfosTableUpdateCompanionBuilder,
          (
            CircleInfo,
            BaseReferences<_$AppDatabase, $CircleInfosTable, CircleInfo>,
          ),
          CircleInfo,
          PrefetchHooks Function()
        > {
  $$CircleInfosTableTableManager(_$AppDatabase db, $CircleInfosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CircleInfosTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CircleInfosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$CircleInfosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> circleID = const Value.absent(),
                Value<String> space = const Value.absent(),
                Value<String> artifactTitle = const Value.absent(),
                Value<String> artifactTendency = const Value.absent(),
                Value<String> nameKana = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> penName = const Value.absent(),
                Value<bool> isManga = const Value.absent(),
                Value<bool> isNovel = const Value.absent(),
                Value<bool> isR18 = const Value.absent(),
                Value<String> homepageURL = const Value.absent(),
                Value<String> twitterURL = const Value.absent(),
                Value<String> pixivURL = const Value.absent(),
                Value<String> imageURL = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CircleInfosCompanion(
                id: id,
                circleID: circleID,
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
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String circleID,
                required String space,
                required String artifactTitle,
                required String artifactTendency,
                required String nameKana,
                required String name,
                Value<String> penName = const Value.absent(),
                required bool isManga,
                required bool isNovel,
                required bool isR18,
                Value<String> homepageURL = const Value.absent(),
                Value<String> twitterURL = const Value.absent(),
                Value<String> pixivURL = const Value.absent(),
                Value<String> imageURL = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CircleInfosCompanion.insert(
                id: id,
                circleID: circleID,
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
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CircleInfosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CircleInfosTable,
      CircleInfo,
      $$CircleInfosTableFilterComposer,
      $$CircleInfosTableOrderingComposer,
      $$CircleInfosTableAnnotationComposer,
      $$CircleInfosTableCreateCompanionBuilder,
      $$CircleInfosTableUpdateCompanionBuilder,
      (
        CircleInfo,
        BaseReferences<_$AppDatabase, $CircleInfosTable, CircleInfo>,
      ),
      CircleInfo,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CircleInfosTableTableManager get circleInfos =>
      $$CircleInfosTableTableManager(_db, _db.circleInfos);
}
