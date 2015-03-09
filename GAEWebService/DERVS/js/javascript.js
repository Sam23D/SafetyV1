var markers = [];
var paths = [];
var pivotMarker;
var map;

function loadScript() {


  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyD_yLNSCSAXMiT6Z7XlZU30nCfCPZ0r0nI&sensor=TRUE&callback=initialize";
  document.body.appendChild(script);

}

function initialize() {
  var center = new google.maps.LatLng(28.67488321600502, -106.07877284288406);
  var mapOptions = {
    zoom: 17 ,
    center: center,
    mapTypeId: google.maps.MapTypeId.SATELLITE
  }

  map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  google.maps.event.addListener(map, 'click', function(event) {

    $("#latlon").val(event.latLng.toString().replace("(","").replace(")",""))
    //console.log(event)

    addPivotMarker( event, map );

  });
}

function addMarker(location, title , safeZone) {
  if( safeZone ){
    icon = 'http://maps.google.com/mapfiles/ms/icons/green-dot.png'
  }else{
    icon =  'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'
  }
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    title :title,
    icon : icon
  });
  markers.push(marker);
}

function clearMarkers() {
  setAllMap(null);
}
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
  $.each( paths, function(index, value){
      console.log(value)
      value.setMap(map);
  } )

}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

function drawNodes(){
  $.get("http://dervsprotocol.appspot.com/routegenerator/"+$("#sesion").val(),
    function(data){
      //console.log(data);
      $.each(data.path,
        function(index, value){
          l1 = new google.maps.LatLng( parseFloat(value.root.split(',')[0]), parseFloat(value.root.split(',')[1]) );
          l2 = new google.maps.LatLng( parseFloat(value.dest.split(',')[0]), parseFloat(value.dest.split(',')[1]) );

          path = new google.maps.Polyline({
            path: [ l1, l2 ],
            strokeColor: '#3498db'
          });
          paths.push(path);
          path.setMap(map)
        }
      )
    }
  )
  $.get( "http://dervsprotocol.appspot.com/node/" + $("#sesion").val(),
    function(data ){
      //console.log( data.nodes[0].location )
      deleteMarkers();
      $.each( data.nodes,
        function ( index, value){
          if( value.rType != 'safezone' ){
            safeZone = false;
          }
          else{
            safeZone = true;
          }
          val = value.location.split(",");
          lat = parseFloat(val[0]);
          lng = parseFloat(val[1]);
          addMarker( new google.maps.LatLng(lat,lng), value.name , safeZone )
          //console.log( "added: "+ value.location )
        }
      )
    }
  )


}

function addPivotMarker( event, map ){

  var title = $('#name').val()
  console.log(title)
  if(pivotMarker){
    pivotMarker.setMap(null);
  }

  pivotMarker = new google.maps.Marker({
    position : event.latLng,
    map : map,
    title : "New Node " + title,
    labelContent: "$425K",
    labelAnchor: new google.maps.Point(22, 0),
    labelClass: "labels", // the CSS class for the label
    labelStyle: {opacity: 0.75}
  });

  map.setCenter(event.latLng);
}

window.onload = loadScript;
