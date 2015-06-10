module.exports = (o) ->
  restaurant= o.restaurant
  menu= o.menu
  build= o.build
  dman= o.dman
  order= o.order
  room= o.room
  account= o.account
  # restaurant= require './models/sequelize/restaurantModel'
  # menu= require './models/sequelize/menuModel'
  # build= require './models/sequelize/buildModel'
  # dman= require './models/sequelize/dmanModel'
  # order= require './models/sequelize/orderModel'
  # room= require './models/sequelize/roomModel'
  # account= require './models/sequelize/accountModel'

  account.create sid: 'M10309205', pw: '12345678', cname: '陳致宇', phone: '0937364902', email: 'M10309205@mail.ntust.edu.tw'
  account.create sid: 'M10309206', pw: '12345678', cname: '瑤瑤', phone: '0937364903', email: 'M10309206@mail.ntust.edu.tw'
  account.create sid: 'M10309207', pw: '12345678', cname: '潔西卡艾芭', phone: '0937332902', email: 'M10309207@mail.ntust.edu.tw'
  account.create sid: 'M10309208', pw: '12345678', cname: '林志玲', phone: '0937364232', email: 'M10309208@mail.ntust.edu.tw'
  account.create sid: 'M10309209', pw: '12345678', cname: '安心亞', phone: '0937543902', email: 'M10309209@mail.ntust.edu.tw'
  account.create sid: 'M10309210', pw: '12345678', cname: '范冰冰', phone: '0937364666', email: 'M103092010@mail.ntust.edu.tw'
  account.create sid: 'M10309211', pw: '12345678', cname: '金城武', phone: '0937364123', email: 'M103092011@mail.ntust.edu.tw'
  account.create sid: 'M10309212', pw: '12345678', cname: '韋禮安', phone: '0937365555', email: 'M103092012@mail.ntust.edu.tw'
  account.create sid: 'M10309213', pw: '12345678', cname: '彭于晏', phone: '0937362222', email: 'M103092013@mail.ntust.edu.tw'
  account.create sid: 'M10309214', pw: '12345678', cname: '張孝全', phone: '0934343422', email: 'M103092014@mail.ntust.edu.tw'

  build.create cname: 'RB', start: 'xx', end: 'xx', time: 5
  build.create cname: 'IB', start: 'xx', end: 'xx', time: 5
  build.create cname: 'MA', start: 'xx', end: 'xx', time: 5
  build.create cname: 'TR', start: 'xx', end: 'xx', time: 5
  build.create cname: 'T4', start: 'xx', end: 'xx', time: 5
  build.create cname: 'EE', start: 'xx', end: 'xx', time: 5
  build.create cname: 'T2', start: 'xx', end: 'xx', time: 5

  dman.create cname: '宋智孝', phone: '0911123321'
  dman.create cname: '白歆惠', phone: '0913212321'
  dman.create cname: '劉香慈', phone: '0911132321'
  dman.create cname: '趙薇', phone: '0911112321'
  dman.create cname: '阿喜', phone: '0915555331'
  dman.create cname: '陳妍希', phone: '0918889321'

  restaurant.create id:'1', cname: '四海遊龍', place: '一餐', img: 'http://i.imgur.com/LT8rslQ.jpg'
  restaurant.create id:'2', cname: '安娜廚房', place: '一餐', img: 'http://i.imgur.com/fEUOhvs.jpg'
  restaurant.create id:'3', cname: '台灣古早味', place: '一餐', img: 'http://i.imgur.com/eJIJl8N.jpg'
  restaurant.create id:'4', cname: '韓風小舖', place: '一餐', img: 'http://i.imgur.com/klzYUPY.jpg'
  restaurant.create id:'5', cname: '牛排館', place: '一餐', img: 'http://i.imgur.com/uKHCxYI.jpg'
  restaurant.create id:'6', cname: '豪享來', place: '三餐', img: 'http://i.imgur.com/uh8B1Em.jpg'
  restaurant.create id:'7', cname: '吉之賀', place: '三餐', img: 'http://i.imgur.com/Ygqtr6F.jpg'
  restaurant.create id:'8', cname: '雞同丫講', place: '三餐', img: 'http://i.imgur.com/OmJTQiq.jpg'
  restaurant.create id:'9', cname: '七辣滷味', place: '三餐', img: 'http://i.imgur.com/iRtgCEL.jpg'



  menu.create cname: '紅油炒手', price: 40, restaurantId: 6
  menu.create cname: '牛肉湯麵', price: 50, restaurantId: 6
  menu.create cname: '酸辣麵', price: 50, restaurantId: 1
  menu.create cname: '招牌鍋貼十個', price: 60, restaurantId: 1
  menu.create cname: '排骨飯', price: 70, restaurantId: 3
  menu.create cname: '雞排飯', price: 80, restaurantId: 3
  menu.create cname: '蒜香義大利麵', price: 55, restaurantId: 2
  menu.create cname: '番茄雞肉義大利麵', price: 60, restaurantId: 2
  menu.create cname: '石鍋拌飯', price: 85, restaurantId: 4
  menu.create cname: '牛肉拌飯', price: 75, restaurantId: 4
  menu.create cname: '鐵板麵', price: 50, restaurantId: 5
  menu.create cname: '超大牛排', price: 180, restaurantId: 5
  menu.create cname: '親子丼', price: 70, restaurantId: 7
  menu.create cname: '牛肉丼', price: 60, restaurantId: 7
  menu.create cname: '鴨腿飯', price: 65, restaurantId: 8
  menu.create cname: '三寶飯', price: 75, restaurantId: 8
  menu.create cname: 'A套餐', price: 50, restaurantId: 9
  menu.create cname: 'B套餐', price: 60, restaurantId: 9




  order.create sid: 'M10309207', cname: '潔西卡艾芭', phone: '0937332902', restName: '四海遊龍', mealName: '酸辣麵',time: '12:30' , quantity: 1, buildName: 'IB', roomName:'101', totalprice: 270
  order.create sid: 'M10309207', cname: '潔西卡艾芭', phone: '0937332902', restName: '吉之賀', mealName: '親子丼',time: '12:30' , quantity: 2, buildName: 'IB', roomName:'101', totalprice: 270
  order.create sid: 'M10309207', cname: '潔西卡艾芭', phone: '0937332902', restName: '七辣滷味', mealName: 'B套餐',time: '12:30' , quantity: 3, buildName: 'IB', roomName:'101', totalprice: 270

  order.create sid: 'M10309205', cname: '陳致宇', phone: '0937364902', restName: '七辣滷味', mealName: 'A套餐',time: '12:30' , quantity: 1, buildName: 'T2', roomName:'102', totalprice: 65
  order.create sid: 'M10309205', cname: '陳致宇', phone: '0937364902', restName: '豪享來', mealName: '紅油炒手',time: '12:30' , quantity: 1, buildName: 'T2', roomName:'102', totalprice: 65
  order.create sid: 'M10309205', cname: '陳致宇', phone: '0937364902', restName: '安娜廚房', mealName: '蒜香義大利麵',time: '12:30' , quantity: 1, buildName: 'T2', roomName:'102', totalprice: 65

  order.create sid: 'M10309213', cname: '張孝全', phone: '0934343422', restName: '四海遊龍', mealName: '酸辣麵',time: '12:45' , quantity: 1, buildName: 'IB', roomName:'102', totalprice: 195
  order.create sid: 'M10309213', cname: '張孝全', phone: '0934343422', restName: '牛排館', mealName: '超大牛排',time: '12:45' , quantity: 2, buildName: 'IB', roomName:'102', totalprice: 195

  order.create sid: 'M10309212', cname: '彭于晏', phone: '0937362222', restName: '七辣滷味', mealName: 'A套餐',time: '12:45' , quantity: 1, buildName: 'TR', roomName:'103', totalprice: 65

  order.create sid: 'M10309206', cname: '瑤瑤', phone: '0937364903', restName: '吉之賀', mealName: '牛肉丼',time: '12:45' , quantity: 2, buildName: 'TR', roomName:'101', totalprice: 185
  order.create sid: 'M10309206', cname: '瑤瑤', phone: '0937364903', restName: '豪享來', mealName: '牛肉湯麵',time: '12:45' , quantity: 2, buildName: 'TR', roomName:'101', totalprice: 185
  order.create sid: 'M10309206', cname: '瑤瑤', phone: '0937364903', restName: '韓風小舖', mealName: '石鍋拌飯',time: '12:45' , quantity: 2, buildName: 'TR', roomName:'101', totalprice: 185

  order.create sid: 'M10309209', cname: '安心亞', phone: '0937364902', restName: '豪享來', mealName: '紅油炒手',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'103', totalprice: 270
  order.create sid: 'M10309209', cname: '安心亞', phone: '0937364902', restName: '四海遊龍', mealName: '酸辣麵',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'103', totalprice: 270
  order.create sid: 'M10309209', cname: '安心亞', phone: '0937364902', restName: '雞同丫講', mealName: '鴨腿飯',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'103', totalprice: 270
  order.create sid: 'M10309209', cname: '安心亞', phone: '0937364902', restName: '安娜廚房', mealName: '番茄雞肉義大利麵',time: '12:45' , quantity: 1, buildName: 'T2', roomName:'103', totalprice: 270
  order.create sid: 'M10309209', cname: '安心亞', phone: '0937364902', restName: '豪享來', mealName: '牛肉湯麵',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'103', totalprice: 270

  order.create sid: 'M10309213', cname: '彭于晏', phone: '0937362222', restName: '牛排館', mealName: '鐵板麵',time: '12:45' , quantity: 3, buildName: 'T2', roomName:'104', totalprice: 165
  order.create sid: 'M10309213', cname: '彭于晏', phone: '0937362222', restName: '雞同丫講', mealName: '三寶飯',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'104', totalprice: 165

  order.create sid: 'M10309211', cname: '金城武', phone: '0937364123', restName: '吉之賀', mealName: '牛肉丼',time: '12:45' , quantity: 1, buildName: 'T2', roomName:'101', totalprice: 460
  order.create sid: 'M10309211', cname: '金城武', phone: '0937364123', restName: '台灣古早味', mealName: '雞排飯',time: '12:45' , quantity: 1, buildName: 'T2', roomName:'101', totalprice: 460
  order.create sid: 'M10309211', cname: '金城武', phone: '0937364123', restName: '七辣滷味', mealName: 'A套餐',time: '12:45' , quantity: 1, buildName: 'T2', roomName:'101', totalprice: 460
  order.create sid: 'M10309211', cname: '金城武', phone: '0937364123', restName: '台灣古早味', mealName: '排骨飯',time: '12:45' , quantity: 2, buildName: 'T2', roomName:'101', totalprice: 460

  order.create sid: 'M10309210', cname: '范冰冰', phone: '0937543902', restName: '韓風小舖', mealName: '石鍋拌飯',time: '12:45' , quantity: 1, buildName: 'MA', roomName:'102', totalprice: 270
  order.create sid: 'M10309210', cname: '范冰冰', phone: '0937543902', restName: '七辣滷味', mealName: 'B套餐',time: '12:45' , quantity: 1, buildName: 'MA', roomName:'102', totalprice: 270
  order.create sid: 'M10309210', cname: '范冰冰', phone: '0937543902', restName: '雞同丫講', mealName: '三寶飯',time: '12:45' , quantity: 1, buildName: 'MA', roomName:'102', totalprice: 270

  order.create sid: 'M10309212', cname: '韋禮安', phone: '0937365555', restName: '韓風小舖', mealName: '韓式拌飯',time: '12:30' , quantity: 1, buildName: 'MA', roomName:'101', totalprice: 345
  order.create sid: 'M10309212', cname: '韋禮安', phone: '0937365555', restName: '四海遊龍', mealName: '酸辣麵',time: '12:30' , quantity: 1, buildName: 'MA', roomName:'101', totalprice: 345
  order.create sid: 'M10309212', cname: '韋禮安', phone: '0937365555', restName: '四海遊龍', mealName: '招牌鍋貼十個',time: '12:30' , quantity: 1, buildName: 'MA', roomName:'101', totalprice: 345
  order.create sid: 'M10309212', cname: '韋禮安', phone: '0937365555', restName: '安娜廚房', mealName: '番茄雞肉義大利麵',time: '12:30' , quantity: 1, buildName: 'MA', roomName:'101', totalprice: 345

  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'RB'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'RB'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'RB'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'TR'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'TR'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'TR'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'MA'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'MA'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'MA'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'IB'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'IB'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'IB'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'T4'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'T4'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'T4'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'EE'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'EE'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'EE'
  room.create cname: '101', start: 'xx', end: 'aa', time: 5, buildName: 'T2'
  room.create cname: '201', start: 'xx', end: 'aa', time: 5, buildName: 'T2'
  room.create cname: '301', start: 'xx', end: 'aa', time: 5, buildName: 'T2'
