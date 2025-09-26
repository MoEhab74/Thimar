class ProductModel {
  final List<ProductData> data;
  final Links links;
  final Meta meta;
  final String status;
  final String message;
  final int userCartCount;
  final double maxPrice;
  final double minPrice;

  ProductModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.status,
    required this.message,
    required this.userCartCount,
    required this.maxPrice,
    required this.minPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: List<ProductData>.from(json['data'].map((x) => ProductData.fromJson(x))),
      links: Links.fromJson(json['links']),
      meta: Meta.fromJson(json['meta']),
      status: json['status'],
      message: json['message'],
      userCartCount: json['user_cart_count'],
      maxPrice: (json['max_price'] as num).toDouble(),
      minPrice: (json['min_price'] as num).toDouble(),
    );
  }
}

class ProductData {
  final int categoryId;
  final int id;
  final String title;
  final String description;
  final String code;
  final double priceBeforeDiscount;
  final double price;
  final double discount;
  final double amount;
  final int isActive;
  final bool isFavorite;
  final Unit unit;
  final List<ImageModel> images;
  final String mainImage;
  final String createdAt;

  ProductData({
    required this.categoryId,
    required this.id,
    required this.title,
    required this.description,
    required this.code,
    required this.priceBeforeDiscount,
    required this.price,
    required this.discount,
    required this.amount,
    required this.isActive,
    required this.isFavorite,
    required this.unit,
    required this.images,
    required this.mainImage,
    required this.createdAt,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      categoryId: json['category_id'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      code: json['code'],
      priceBeforeDiscount: (json['price_before_discount'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      isActive: json['is_active'],
      isFavorite: json['is_favorite'],
      unit: Unit.fromJson(json['unit']),
      images: List<ImageModel>.from(
        json['images'].map((x) => ImageModel.fromJson(x)),
      ),
      mainImage: json['main_image'],
      createdAt: json['created_at'],
    );
  }
}

class Unit {
  final int id;
  final String? name;
  final String type;
  final String createdAt;
  final String updatedAt;

  Unit({
    required this.id,
    this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class ImageModel {
  final String name;
  final String url;

  ImageModel({required this.name, required this.url});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(name: json['name'], url: json['url']);
  }
}

class Links {
  final String first;
  final String last;
  final String? prev;
  final String? next;

  Links({required this.first, required this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<PageLink> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: List<PageLink>.from(
        json['links'].map((x) => PageLink.fromJson(x)),
      ),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class PageLink {
  final String? url;
  final String label;
  final bool active;

  PageLink({this.url, required this.label, required this.active});

  factory PageLink.fromJson(Map<String, dynamic> json) {
    return PageLink(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
