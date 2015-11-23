var map
var eventsCollection
var infoWindow
var gLatLng
var name
var description
var input = "<table>" +
    "<tr><td>Name:</td> <td><input type='text' id='name'/> </td> </tr>" +
    "<tr><td>Description:</td> <td><input type='text' id='description'/></td> </tr>" +
    "<tr><td></td><td><input type='button' value='Save & Close' onclick='saveData()'/></td></tr>";

var info  = "<table>" +
    "<tr><td>Name:</td> <td id='name'><% name %></td></tr>" +
    "<tr><td>Description:</td> <td id='description'><% description %></td></tr>";

function initialize() {
    var mapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(49.282875, -123.120464),
        streetViewControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);


    map.addListener('click', function(e) {
        createEvent(e.latLng, map);
    });

}

function createEvent(latLng, map) {
    var lat = latLng.lat();
    var lng = latLng.lng();

    infoWindow = new google.maps.InfoWindow({
        content: input
    });

    openWindow(latLng);
}


function closeWindow(location) {
    infoWindow.close(map);
}

// Opens window for creator to enter content
function openWindow(location) {
    infoWindow.setPosition(location);
    infoWindow.open(map);
}

// Refreshes window with updated content information following a user's click
function viewWindow(location) {
    loadContent(infoWindow, location);
    infoWindow.setPosition(location);
    infoWindow.open(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
