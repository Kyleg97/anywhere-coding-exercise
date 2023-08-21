import 'dart:convert';

class CharacterInfo {
  final String? characterAbstract;
  final String? abstractSource;
  final String? abstractText;
  final String? abstractUrl;
  final String? answer;
  final String? answerType;
  final String? definition;
  final String? definitionSource;
  final String? definitionUrl;
  final String? entity;
  final String? heading;
  final String? image;
  final int? imageHeight;
  final int? imageIsLogo;
  final int? imageWidth;
  final String? infobox;
  final String? redirect;
  final List<RelatedTopic>? relatedTopics;
  final List<dynamic>? results;
  final String? type;
  final Meta? meta;

  CharacterInfo({
    this.characterAbstract,
    this.abstractSource,
    this.abstractText,
    this.abstractUrl,
    this.answer,
    this.answerType,
    this.definition,
    this.definitionSource,
    this.definitionUrl,
    this.entity,
    this.heading,
    this.image,
    this.imageHeight,
    this.imageIsLogo,
    this.imageWidth,
    this.infobox,
    this.redirect,
    this.relatedTopics,
    this.results,
    this.type,
    this.meta,
  });

  factory CharacterInfo.fromRawJson(String str) =>
      CharacterInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterInfo.fromJson(Map<String, dynamic> json) => CharacterInfo(
        characterAbstract: json["Abstract"],
        abstractSource: json["AbstractSource"],
        abstractText: json["AbstractText"],
        abstractUrl: json["AbstractURL"],
        answer: json["Answer"],
        answerType: json["AnswerType"],
        definition: json["Definition"],
        definitionSource: json["DefinitionSource"],
        definitionUrl: json["DefinitionURL"],
        entity: json["Entity"],
        heading: json["Heading"],
        image: json["Image"],
        imageHeight: json["ImageHeight"],
        imageIsLogo: json["ImageIsLogo"],
        imageWidth: json["ImageWidth"],
        infobox: json["Infobox"],
        redirect: json["Redirect"],
        relatedTopics: json["RelatedTopics"] == null
            ? []
            : List<RelatedTopic>.from(
                json["RelatedTopics"]!.map((x) => RelatedTopic.fromJson(x))),
        results: json["Results"] == null
            ? []
            : List<dynamic>.from(json["Results"]!.map((x) => x)),
        type: json["Type"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "Abstract": characterAbstract,
        "AbstractSource": abstractSource,
        "AbstractText": abstractText,
        "AbstractURL": abstractUrl,
        "Answer": answer,
        "AnswerType": answerType,
        "Definition": definition,
        "DefinitionSource": definitionSource,
        "DefinitionURL": definitionUrl,
        "Entity": entity,
        "Heading": heading,
        "Image": image,
        "ImageHeight": imageHeight,
        "ImageIsLogo": imageIsLogo,
        "ImageWidth": imageWidth,
        "Infobox": infobox,
        "Redirect": redirect,
        "RelatedTopics": relatedTopics == null
            ? []
            : List<dynamic>.from(relatedTopics!.map((x) => x.toJson())),
        "Results":
            results == null ? [] : List<dynamic>.from(results!.map((x) => x)),
        "Type": type,
        "meta": meta?.toJson(),
      };
}

class Meta {
  final dynamic attribution;
  final dynamic blockgroup;
  final dynamic createdDate;
  final String? description;
  final dynamic designer;
  final dynamic devDate;
  final String? devMilestone;
  final List<Developer>? developer;
  final String? exampleQuery;
  final String? id;
  final dynamic isStackexchange;
  final String? jsCallbackName;
  final dynamic liveDate;
  final Maintainer? maintainer;
  final String? name;
  final String? perlModule;
  final dynamic producer;
  final String? productionState;
  final String? repo;
  final String? signalFrom;
  final String? srcDomain;
  final int? srcId;
  final String? srcName;
  final SrcOptions? srcOptions;
  final dynamic srcUrl;
  final String? status;
  final String? tab;
  final List<String>? topic;
  final int? unsafe;

  Meta({
    this.attribution,
    this.blockgroup,
    this.createdDate,
    this.description,
    this.designer,
    this.devDate,
    this.devMilestone,
    this.developer,
    this.exampleQuery,
    this.id,
    this.isStackexchange,
    this.jsCallbackName,
    this.liveDate,
    this.maintainer,
    this.name,
    this.perlModule,
    this.producer,
    this.productionState,
    this.repo,
    this.signalFrom,
    this.srcDomain,
    this.srcId,
    this.srcName,
    this.srcOptions,
    this.srcUrl,
    this.status,
    this.tab,
    this.topic,
    this.unsafe,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        attribution: json["attribution"],
        blockgroup: json["blockgroup"],
        createdDate: json["created_date"],
        description: json["description"],
        designer: json["designer"],
        devDate: json["dev_date"],
        devMilestone: json["dev_milestone"],
        developer: json["developer"] == null
            ? []
            : List<Developer>.from(
                json["developer"]!.map((x) => Developer.fromJson(x))),
        exampleQuery: json["example_query"],
        id: json["id"],
        isStackexchange: json["is_stackexchange"],
        jsCallbackName: json["js_callback_name"],
        liveDate: json["live_date"],
        maintainer: json["maintainer"] == null
            ? null
            : Maintainer.fromJson(json["maintainer"]),
        name: json["name"],
        perlModule: json["perl_module"],
        producer: json["producer"],
        productionState: json["production_state"],
        repo: json["repo"],
        signalFrom: json["signal_from"],
        srcDomain: json["src_domain"],
        srcId: json["src_id"],
        srcName: json["src_name"],
        srcOptions: json["src_options"] == null
            ? null
            : SrcOptions.fromJson(json["src_options"]),
        srcUrl: json["src_url"],
        status: json["status"],
        tab: json["tab"],
        topic: json["topic"] == null
            ? []
            : List<String>.from(json["topic"]!.map((x) => x)),
        unsafe: json["unsafe"],
      );

  Map<String, dynamic> toJson() => {
        "attribution": attribution,
        "blockgroup": blockgroup,
        "created_date": createdDate,
        "description": description,
        "designer": designer,
        "dev_date": devDate,
        "dev_milestone": devMilestone,
        "developer": developer == null
            ? []
            : List<dynamic>.from(developer!.map((x) => x.toJson())),
        "example_query": exampleQuery,
        "id": id,
        "is_stackexchange": isStackexchange,
        "js_callback_name": jsCallbackName,
        "live_date": liveDate,
        "maintainer": maintainer?.toJson(),
        "name": name,
        "perl_module": perlModule,
        "producer": producer,
        "production_state": productionState,
        "repo": repo,
        "signal_from": signalFrom,
        "src_domain": srcDomain,
        "src_id": srcId,
        "src_name": srcName,
        "src_options": srcOptions?.toJson(),
        "src_url": srcUrl,
        "status": status,
        "tab": tab,
        "topic": topic == null ? [] : List<dynamic>.from(topic!.map((x) => x)),
        "unsafe": unsafe,
      };
}

class Developer {
  final String? name;
  final String? type;
  final String? url;

  Developer({
    this.name,
    this.type,
    this.url,
  });

  factory Developer.fromRawJson(String str) =>
      Developer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        name: json["name"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "url": url,
      };
}

class Maintainer {
  final String? github;

  Maintainer({
    this.github,
  });

  factory Maintainer.fromRawJson(String str) =>
      Maintainer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maintainer.fromJson(Map<String, dynamic> json) => Maintainer(
        github: json["github"],
      );

  Map<String, dynamic> toJson() => {
        "github": github,
      };
}

class SrcOptions {
  final String? directory;
  final int? isFanon;
  final int? isMediawiki;
  final int? isWikipedia;
  final String? language;
  final String? minAbstractLength;
  final int? skipAbstract;
  final int? skipAbstractParen;
  final String? skipEnd;
  final int? skipIcon;
  final int? skipImageName;
  final String? skipQr;
  final String? sourceSkip;
  final String? srcInfo;

  SrcOptions({
    this.directory,
    this.isFanon,
    this.isMediawiki,
    this.isWikipedia,
    this.language,
    this.minAbstractLength,
    this.skipAbstract,
    this.skipAbstractParen,
    this.skipEnd,
    this.skipIcon,
    this.skipImageName,
    this.skipQr,
    this.sourceSkip,
    this.srcInfo,
  });

  factory SrcOptions.fromRawJson(String str) =>
      SrcOptions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SrcOptions.fromJson(Map<String, dynamic> json) => SrcOptions(
        directory: json["directory"],
        isFanon: json["is_fanon"],
        isMediawiki: json["is_mediawiki"],
        isWikipedia: json["is_wikipedia"],
        language: json["language"],
        minAbstractLength: json["min_abstract_length"],
        skipAbstract: json["skip_abstract"],
        skipAbstractParen: json["skip_abstract_paren"],
        skipEnd: json["skip_end"],
        skipIcon: json["skip_icon"],
        skipImageName: json["skip_image_name"],
        skipQr: json["skip_qr"],
        sourceSkip: json["source_skip"],
        srcInfo: json["src_info"],
      );

  Map<String, dynamic> toJson() => {
        "directory": directory,
        "is_fanon": isFanon,
        "is_mediawiki": isMediawiki,
        "is_wikipedia": isWikipedia,
        "language": language,
        "min_abstract_length": minAbstractLength,
        "skip_abstract": skipAbstract,
        "skip_abstract_paren": skipAbstractParen,
        "skip_end": skipEnd,
        "skip_icon": skipIcon,
        "skip_image_name": skipImageName,
        "skip_qr": skipQr,
        "source_skip": sourceSkip,
        "src_info": srcInfo,
      };
}

class RelatedTopic {
  final String? firstUrl;
  final Icon? icon;
  final String? result;
  final String? text;

  RelatedTopic({
    this.firstUrl,
    this.icon,
    this.result,
    this.text,
  });

  String? getCharacterName() {
    if (text == null) return null;
    int endIndex = text!.indexOf("-");
    if (endIndex == -1) return text;
    String name = text!.substring(0, endIndex - 1);
    return name.trim();
  }

  String? getSimplifiedDescription() {
    if (text == null) return null;
    int startIndex = text!.indexOf("-");
    if (startIndex == -1) return text;
    String description = text!.substring(startIndex + 1);
    return description.trim();
  }

  factory RelatedTopic.fromRawJson(String str) =>
      RelatedTopic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RelatedTopic.fromJson(Map<String, dynamic> json) => RelatedTopic(
        firstUrl: json["FirstURL"],
        icon: json["Icon"] == null ? null : Icon.fromJson(json["Icon"]),
        result: json["Result"],
        text: json["Text"],
      );

  Map<String, dynamic> toJson() => {
        "FirstURL": firstUrl,
        "Icon": icon?.toJson(),
        "Result": result,
        "Text": text,
      };
}

class Icon {
  final String? height;
  final String? url;
  final String? width;

  Icon({
    this.height,
    this.url,
    this.width,
  });

  String? getUrlPath() {
    if (url == null || url == "") return null;
    return "https://duckduckgo.com/$url";
  }

  factory Icon.fromRawJson(String str) => Icon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        height: json["Height"],
        url: json["URL"],
        width: json["Width"],
      );

  Map<String, dynamic> toJson() => {
        "Height": height,
        "URL": url,
        "Width": width,
      };
}
