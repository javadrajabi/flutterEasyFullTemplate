/// id : 4
/// code : "4"
/// name : "رونمایی از ربات های خانگی و اسپیکر هوشم"
/// category : "1"
/// keywords : "قدرت پردازش, لوازم خانگی, اسپیکر, اسپیکر هوشمند, DuerOS"
/// description : "<p>امروز برای اولین بار از دو ربات خانگی و یک اسپیکر هوشمند مجهز به DuerOS، فناوری رقیب کورتانای مایکروسافت ...</p>\r\n"
/// fulldescription : "<p>بایدو امروز برای اولین بار از دو ربات خانگی و یک اسپیکر هوشمند مجهز به DuerOS، فناوری رقیب کورتانای مایکروسافت و الکسای آمازون، رونمایی کرد. هر سه دستگاه که بخشی از خانواده Raven به حساب می آیند، امروز در کنفرانس Baidu World در پکن معرفی شدند.</p>\r\n\r\n<p>بیش از ۱۰۰ وسیله خانگی و ابزار مثل تلفن هوشمند، تلویزیون، یخچال و حتی ماشین لباسشویی از DuerOS بهره می برند اما سری Raven اولین محصولاتی هستند که برای به کارگیری سرویس هوش مصنوعی آن ساخته شده اند.</p>\r\n\r\n<p>اسپیکر هوشمند H از ماه آینده و با قیمت ۲۵۶ دلار برای فروش به بازار ارائه می شود. این اسپیکر توسط Raven Tech و Teenage Engineering طراحی شده و یک کنترلر با نمایشگر LED لمسی دارد که می توان آن را از پایه دستگاه جدا کرد و در محدوده وای فای با فرامین صوتی از آن استفاده کرد.</p>\r\n\r\n<p>کنترلر H نیز می تواند محصولات سری Raven و دیگر وسایل خانگی هوشمند را کنترل کند.</p>\r\n\r\n<p>هوش مصنوعی سخنگوی&nbsp; DuerOS می تواند کارهایی که دیگر دستیارهای هوشمند مثل الکسا و گوگل اسیستنت انجام دهد&nbsp;مثل جستجوی وب، انتقال وجه، پخش موسیقی، کنترل وسایل خانگی هوشمند و... را پیگری کرده و به انجام رساند.</p>\r\n\r\n<p>ربات Raven R یک بازوی رباتیک مجهز به نمایشگر LED است و می تواند موقع پخش موسیقی همراه با ریتم برقصد و در مواقع لزوم با ایجاد حالاتی، احساسات خود را نشان دهد.</p>\r\n\r\n<p>سومین دستگاه که Raven Q نام دارد دارای قدرت پردازش زبان است و می تواند از محیط اطراف خود یک مدل سه بعدی تهیه کند. هنوز در مورد قیمت و زمان عرضه Raven R و Raven Q حرفی به میان نیامده است.</p>\r\n\r\n<p>DuerOS از ماه جولای در دسترس کسب و کارها و توسعه دهندگان قرار گرفت و سال ها است که توسط بسیاری از لوازم خانگی مورد استفاده قرار می گیرد.</p>\r\n\r\n<p>بایدو در ماه فوریه یک استارتاپ کوچک با نام Raven Tech را خریداری کرد و حالا محصولات تولیدی آن، با نام Raven قرار است عرضه شوند.</p>\r\n"
/// viewcount : 0
/// setdate : "1396/08/25 18:13:10"
/// image : "146035.png"
/// linkcatalog : null
/// linkvideo : null
/// gallerycat : null
/// slideshowcat : null
/// linkcat : 1
/// contentscat : null
/// advertisecat : null
/// pollingcat : null
/// productcat : null
/// faqcat : null
/// sort : 4
/// style : null
/// portalid : 2
/// status : "1"

class ServicesProvider {
  ServicesProvider({
      this.id, 
      this.code, 
      this.name, 
      this.category, 
      this.keywords, 
      this.description, 
      this.fulldescription, 
      this.viewcount, 
      this.setdate, 
      this.image, 
      this.linkcatalog, 
      this.linkvideo, 
      this.gallerycat, 
      this.slideshowcat, 
      this.linkcat, 
      this.contentscat, 
      this.advertisecat, 
      this.pollingcat, 
      this.productcat, 
      this.faqcat, 
      this.sort, 
      this.style, 
      this.portalid, 
      this.status,});

  ServicesProvider.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    category = json['category'];
    keywords = json['keywords'];
    description = json['description'];
    fulldescription = json['fulldescription'];
    viewcount = json['viewcount'];
    setdate = json['setdate'];
    image = json['image'];
    linkcatalog = json['linkcatalog'];
    linkvideo = json['linkvideo'];
    gallerycat = json['gallerycat'];
    slideshowcat = json['slideshowcat'];
    linkcat = json['linkcat'];
    contentscat = json['contentscat'];
    advertisecat = json['advertisecat'];
    pollingcat = json['pollingcat'];
    productcat = json['productcat'];
    faqcat = json['faqcat'];
    sort = json['sort'];
    style = json['style'];
    portalid = json['portalid'];
    status = json['status'];
  }
  int? id;
  String? code;
  String? name;
  String? category;
  String? keywords;
  String? description;
  String? fulldescription;
  int? viewcount;
  String? setdate;
  String? image;
  dynamic linkcatalog;
  dynamic linkvideo;
  dynamic gallerycat;
  dynamic slideshowcat;
  int? linkcat;
  dynamic contentscat;
  dynamic advertisecat;
  dynamic pollingcat;
  dynamic productcat;
  dynamic faqcat;
  int? sort;
  dynamic style;
  int? portalid;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['category'] = category;
    map['keywords'] = keywords;
    map['description'] = description;
    map['fulldescription'] = fulldescription;
    map['viewcount'] = viewcount;
    map['setdate'] = setdate;
    map['image'] = image;
    map['linkcatalog'] = linkcatalog;
    map['linkvideo'] = linkvideo;
    map['gallerycat'] = gallerycat;
    map['slideshowcat'] = slideshowcat;
    map['linkcat'] = linkcat;
    map['contentscat'] = contentscat;
    map['advertisecat'] = advertisecat;
    map['pollingcat'] = pollingcat;
    map['productcat'] = productcat;
    map['faqcat'] = faqcat;
    map['sort'] = sort;
    map['style'] = style;
    map['portalid'] = portalid;
    map['status'] = status;
    return map;
  }

}