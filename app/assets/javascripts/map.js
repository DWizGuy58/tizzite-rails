var map
//this will implement the Singleton pattern, so only one infoWindow will exist at once
var infoWindow
var newEventInfo =
    "<div class=\"popup-form\">" +
    "<div class=\"input-group\">" +
    "<span class=\"input-group-addon\" id=\"event-name\">Name: </span>" +
    "<input type=\"text\" class=\"form-control\" placeholder=\"Name the event\" aria-describedby=\"basic-addon1\">" +
    "</div>" +
    "<div class=\"input-group\">" +
    "<span class=\"input-group-addon\" id=\"event-description\">Description: </span>" +
    "<input type=\"text\" class=\"form-control\" placeholder=\"Describe the event\" aria-describedby=\"basic-addon1\">" +
    "</div>" +
    "<button id=\"create-event\" type=\"button\" class=\"btn btn-primary\" onclick=\"saveAndClose()\">Create!</button>" +
    "</div>";

function initialize() {
    var mapOptions = {
        zoom: 12,
        center: new google.maps.LatLng(49.282875, -123.120464),
        streetViewControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    var listenerHandle =
    map.addListener('click', function(e) {
        if (infoWindow == null) {
            createEvent(e.latLng, map);
        }
    });
}

// Creates a new event
function createEvent(latLng) {

    infoWindow = new google.maps.InfoWindow({
        content: newEventInfo,
        location: latLng
    });

    openWindow(latLng);
}

// Closes window
function closeWindow(location) {
    infoWindow.close(map);
    infoWindow = null;
}

// Opens window for creator to enter content
// Also disables clickable event on map so no more than 1 window can exist
// At a time
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
function saveAndClose(latLng, map) {

    var marker = new google.maps.Marker({
        position: latLng,
        map: map,
        animation: google.maps.Animation.DROP
    });

    closeWindow(latLng);
}

google.maps.event.addDomListener(window, 'load', initialize);
