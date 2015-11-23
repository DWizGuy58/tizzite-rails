var map
var eventsCollection
var infoWindow
var gLatLng
var name
var description
var newEventInfo =
    "<div class=\"input-group\">" +
    "<span class=\"input-group-addon\" id=\"event-name\">Name: </span>" +
    "<input type=\"text\" class=\"form-control\" placeholder=\"Name the event\" aria-describedby=\"basic-addon1\">" +
    "</div>" +
    "<div class=\"input-group\">" +
    "<span class=\"input-group-addon\" id=\"event-description\">Description: </span>" +
    "<input type=\"text\" class=\"form-control\" placeholder=\"Describe the event\" aria-describedby=\"basic-addon1\">" +
    "</div>" +
    "<button id=\"create-event\" type=\"button\" class=\"btn btn-primary\">Create!</button>";

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
        content: newEventInfo
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

// Saves data to the DB to create the event
function saveAndClose() {

}

google.maps.event.addDomListener(window, 'load', initialize);
