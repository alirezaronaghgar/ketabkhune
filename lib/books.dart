class booky {
  List<book> bok;

  booky({this.bok});

  booky.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      bok = new List<book>();
      json['books'].forEach((v) {
        bok.add(new book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bok != null) {
      data['books'] = this.bok.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class book {
  String id;
  String name;
  String img;
  String writer;
  String cost;
  String detail;


  book(
      {this.id,
        this.name,
        this.img,
        this.writer,
        this.cost,
        this.detail
      });

  book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    writer = json['writer'];
    cost = json['cost'];
    detail=json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['writer'] = this.writer;
    data['cost'] = this.cost;
    data['detail'] = this.detail;

    return data;
  }
}

