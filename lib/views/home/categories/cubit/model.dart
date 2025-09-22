class CategoryModel {
  late final List<CategoryDate> data;
  late final Links links;
  late final Meta meta; // Meta type because it just a map with some properties
  late final String status, message;

  CategoryModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
  });

  // Traditional way by the default constructor

  // CategoriesModel(Map<String, dynamic> map) {
  //   data = (map['data'] as List)
  //       .map((e) => CategoryDate(e))
  //       .toList(); // Convert list of maps to list of objects
  //   links = Links(
  //     map['links'] ?? {},
  //   ); // Object of Links class beacause it just a map with some properties
  //   meta = Meta(
  //     map['meta'] ?? {},
  //   ); // The same thing like links ===> object of Meta class
  //   status = map['status'] ?? '';
  //   message = map['message'] ?? '';
  // }

  // Using the factory constructor instead of the traditional way (default constructor)
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      data: (map['data'] as List)
          .map((e) => CategoryDate(e))
          .toList(), // Convert list of maps to list of objects
      links: Links.fromJson(
        map['links'] ?? {},
      ), // Object of Links class beacause it just a map with some properties
      meta: Meta.fromJson(
        map['meta'] ?? {},
      ), // The same thing like links ===> object of Meta class
      status: map['status'] ?? '',
      message: map['message'] ?? '',
    );
  }
}

class Meta {
  late final int currentPage, from, lastPage, perPage, to, total;
  late final List<MetaLinks> links;
  late final String path;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.to,
    required this.total,
    required this.links,
    required this.path,
  });

  // Traditional way by the default constructor

  // Meta(Map<String, dynamic> map) {
  //   currentPage = map['current_page'] ?? 0;
  //   from = map['from'] ?? 0;
  //   lastPage = map['last_page'] ?? 0;
  //   perPage = map['per_page'] ?? 0;
  //   to = map['to'] ?? 0;
  //   total = map['total'] ?? 0;
  //   path = map['path'] ?? '';
  //   links = (map['links'] as List).map((e) => MetaLinks(e)).toList();

  // Traditional way to convert a list of maps to a list of objects

  //  List<MetaLinks> linkObjects = [];
  //  links.forEach((element) {
  //    linkObjects.add(MetaLinks(element));
  //  });

  // Using the factory constructor instead of the traditional way (default constructor)
  factory Meta.fromJson(Map<String, dynamic> map) {
    return Meta(
      currentPage: map['current_page'] ?? 0,
      from: map['from'] ?? 0,
      lastPage: map['last_page'] ?? 0,
      perPage: map['per_page'] ?? 0,
      to: map['to'] ?? 0,
      total: map['total'] ?? 0,
      links: (map['links'] as List).map((e) => MetaLinks(e)).toList(),
      path: map['path'] ?? '',
    );
  }
}

class MetaLinks {
  late String url, label;
  late bool active;
  // This constructor to get data from the api map ===> like the factory constructor
  MetaLinks(Map<String, dynamic> map) {
    url = map['url'] ?? '';
    label = map['label'] ?? '';
    active = map['active'] ?? false;
  }
}

class Links {
  late String first, last, prev, next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  // Traditional by the default constructor

  // Links(Map<String, dynamic> map) {
  //   first = map['first'] ?? '';
  //   last = map['last'] ?? '';
  //   prev = map['prev'] ?? '';
  //   next = map['next'] ?? '';
  // }

  // Using the factory constructor instead of the traditional way (default constructor)
  factory Links.fromJson(Map<String, dynamic> map) {
    return Links(
      first: map['first'] ?? '',
      last: map['last'] ?? '',
      prev: map['prev'] ?? '',
      next: map['next'] ?? '',
    );
  }
}

class CategoryDate {
  late int id;
  late String? name, description;
  late String media;
  CategoryDate(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    name = map['name'] ?? '';
    description = map['description'] ?? '';
    media = map['media'];
  }
}
