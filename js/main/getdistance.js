var source, destination;
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
google.maps.event.addDomListener(window, 'load', function () {
new google.maps.places.SearchBox(document.getElementById('txtSource'));
new google.maps.places.SearchBox(document.getElementById('txtDestination'));
directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
});

function GetRoute() {
var cat_home = new google.maps.LatLng(43.838634, 125.337772);
var mapOptions = {
    zoom: 7,
    center: cat_home
};
map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
directionsDisplay.setMap(map);
directionsDisplay.setPanel(document.getElementById('dvPanel'));

//*********DIRECTIONS AND ROUTE**********************//
source = document.getElementById("txtSource").value;
destination = document.getElementById("txtDestination").value;

var request = {
    origin: source,
    destination: destination,
    travelMode: google.maps.TravelMode.DRIVING
};
directionsService.route(request, function (response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
    }
});

//*********DISTANCE AND DURATION**********************//
var service = new google.maps.DistanceMatrixService();
service.getDistanceMatrix({
    origins: [source],
    destinations: [destination],
    travelMode: google.maps.TravelMode.DRIVING,
    unitSystem: google.maps.UnitSystem.METRIC,
    avoidHighways: false,
    avoidTolls: false
}, function (response, status) {
    if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
        var distance = response.rows[0].elements[0].distance.text;
        var duration = response.rows[0].elements[0].duration.text;
        var dvDistance = document.getElementById("dvDistance");
        dvDistance.innerHTML = "";
        dvDistance.innerHTML += "距离Distance: " + distance + "<br />";
        dvDistance.innerHTML += "大约需要Duration:" + duration;

    } else {
        alert("Unable to find the distance via road.");
    }
});