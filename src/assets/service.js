export default{
	url(u){
		let t=this;
		return t.baseURL.trim()+t[u.trim()];
	},
	baseURL:"http://127.0.0.1/wochuang/public",
	// 管理员相关
	doLogin:"/index/Managercontroller/doLogin",
	doExit:"/index/Managercontroller/doExit",
	doRegister:"/index/Managercontroller/doRegister",
	doDeleteManager:"/index/Managercontroller/doDelete",//```
	managerList:"/index/Managercontroller/managerList",
	managerFindInKeyWord:"/index/Managercontroller/managerFindInKeyWord",
	
	//前台用户相关
	userList :"/index/user/userList",
	userFindInKeyWord :"/index/user/userFindInKeyWord",
	doDeleteUser :"/index/user/doDelete",//```

	// 商品相关
	addSlider :"/index/Slide/addSlider",
	delFileSlide :"/index/Slide/delFile",//```
	getSliderList :"/index/Slide/getSliderList",
	getSliderById :"/index/Slide/getSliderById",
	delSlider :"/index/Slide/delSlider",
	modifySlider :"/index/Slide/modifySlider",
	addClassify :"/index/Classifycontroller/addClassify",
	modifyClassify :"/index/Classifycontroller/modifyClassify",
	doUploadImgClassify :"/index/Classifycontroller/doUploadImg",//```
	delFileClassify :"/index/Classifycontroller/delFile",//```
	delClassify :"/index/Classifycontroller/delClassify",
	getClassify :"/index/Classifycontroller/getClassify",
	getClassifyList :"/index/Classifycontroller/getClassifyList",
	getClassifyByKeyWord :"/index/Classifycontroller/getClassifyByKeyWord",
	addGoods :"/index/goodscontroller/addGoods",
	doUploadImgGoods :"/index/goodscontroller/doUploadImg",
	doUploadImgSlide :"/index/Slide/doUploadImg",
	delFileGoods :"/index/goodscontroller/delFile",//```
	modifyGoods :"/index/goodscontroller/modifyGoods",
	modifyGoodsProduce :"/index/goodscontroller/modifyGoodsProduce",
	delGoods :"/index/goodscontroller/delGoods",
	getGoods :"/index/Goodscontroller/getGoods",
	getGoodsList :"/index/Goodscontroller/getGoodsList",
	getGoodsByKeyWord :"/index/Goodscontroller/getGoodsByKeyWord",
	getGoodsById :"/index/Goodscontroller/getGoodsById",


	// 数据统计
	countPayType :"/index/Ordercontroller/countPayType",
	countOrderStatu :"/index/Ordercontroller/countOrderStatu",
	countRegister :"/index/user/countRegister",

	// 特价
	addSale :"/index/Salecontroller/addSale",
	getSaleList :"/index/Salecontroller/getSaleList",
	modifySale :"/index/Salecontroller/modifySale",
	delSale :"/index/Salecontroller/delSale",

	// 订单相关
	getMSOrderList :"/index/Ordercontroller/getMSOrderList",
	modifyOrderStatus :"/index/Ordercontroller/modifyOrderStatus"
}