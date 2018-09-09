function map3d(dim) {
    map = new AMap.Map('container', {
        resizeEnable: true,
        rotateEnable: true,
        pitchEnable: true,
        zoom: 17,
        pitch: 80,
        rotation: -15,
        viewMode: dim,//开启3D视图，默认为关闭
        buildingAnimation: true,//楼块出现是否带动画


        expandZoomRange: true,
        zooms: [3, 20],
        center: [116.333926, 39.997245]
    });
}

// 实例化点标记
function addMarker(lng,lat) {
    var point = new AMap.LngLat(lng,lat);
    var marker = new AMap.Marker({
        icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
        position: point//[lng, lat]
    });
    marker.setMap(map);
}

function onAddPoint() {
    map.on('click', function (e) {
        var point = e.lnglat;
        addMarker(point.getLng(),
            point.getLat()
        );
    });
}

//添加线
function addLine() {
    var lineArr = [
        [116.368904, 39.913423],
        [116.382122, 39.901176],
        [116.387271, 39.912501],
        [116.398258, 39.904600]
    ];
    var polyline = new AMap.Polyline({
        path: lineArr,          //设置线覆盖物路径
        strokeColor: "#ff2c1d", //线颜色
        strokeOpacity: 1,       //线透明度
        strokeWeight: 5,        //线宽
        strokeStyle: "solid",   //线样式
        strokeDasharray: [10, 5] //补充线样式
    });
    polyline.setMap(map);
}

//添加圆覆盖物
function addCircle() {
    circle = new AMap.Circle({
        center:new AMap.LngLat("116.403322","39.920255"),// 圆心位置
        radius:10000, //半径
        strokeColor: "#F33", //线颜色
        strokeOpacity: 1, //线透明度
        strokeWeight: 3, //线粗细度
        fillColor: "#ee2200", //填充颜色
        fillOpacity: 0.35//填充透明度
    });
    circle.setMap(map);
}

//添加多边形覆盖物
function addPolygon(){
    var polygonArr=new Array();//多边形覆盖物节点坐标数组
    polygonArr.push(new AMap.LngLat("116.319809","39.956596"));
    polygonArr.push(new AMap.LngLat("116.556702","39.983434"));
    polygonArr.push(new AMap.LngLat("116.483917","39.845449"));
    polygonArr.push(new AMap.LngLat("116.244278","39.848612"));
    polygon=new AMap.Polygon({
        path:polygonArr,//设置多边形边界路径
        strokeColor:"#56ff08", //线颜色
        strokeOpacity:0.8, //线透明度
        strokeWeight:3,    //线宽
        fillColor: "#304af5", //填充色
        fillOpacity: 0.5//填充透明度
    });
    polygon.setMap(map);
}

//清除覆盖物
function claenmap() {
    map.clearMap();
}

//获取缩放级别
function getSF() {
    var lv=map.getZoom();
    alert("当前地图缩放级别为："+lv);
}
//获取中心点坐标
function getZXD() {
    alert("当前地图中心点坐标为："+map.getCenter())
}
//获取比例尺
function getBLC(){
    alert("当前地图比例尺为："+map.getScale());
}
//放大
function toBig() {
    map.zoomIn();
}
//缩小
function toSmall() {
    map.zoomOut();
}

