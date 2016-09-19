<?php
include_once 'classes/Header/header.php';
?>
<!--content-->
<div class="content"> 

    <section class="content_map">
        <div class="google-map-api"> 
            <div id="map-canvas" class="gmap"></div> 
        </div> 
    </section>

    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <h2 class="indent">Addresses</h2>
                <div class="info">
                    <h3>Address 1:</h3>
                    <p>The Company Name Inc.<br>84, Charing Cross Road,London, D04 89GR.</p>
                    <h3>Telephones:</h3>
                    <p>+1 800 559 6580<br>+1 800 603 6035</p>
                    <h3>Address 2:</h3>
                    <p>The Company Name Inc.<br>84, Charing Cross Road,London, MG09 99HT. </p>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <h2 class="indent">Contact Form</h2>
                <form id="contact-form">
                      <div class="contact-form-loader"></div>
                      <fieldset>
                        <label class="name form-div-1">
                            <strong>Name*</strong>
                          <input type="text" name="name" placeholder="" value="" data-constraints="@Required @JustLetters"  />
                          <span class="empty-message">*This field is required.</span>
                          <span class="error-message">*This is not a valid name.</span>
                        </label>
                        <label class="email form-div-2">
                            <strong>E-mail*</strong>
                          <input type="text" name="email" placeholder="" value="" data-constraints="@Required @Email" />
                          <span class="empty-message">*This field is required.</span>
                          <span class="error-message">*This is not a valid email.</span>
                        </label>
                        <label class="phone form-div-3">
                            <strong>Phone</strong>
                          <input type="text" name="phone" placeholder="" value="" data-constraints="@JustNumbers" />
                          <span class="empty-message">*This field is required.</span>
                          <span class="error-message">*This is not a valid phone.</span>
                        </label>
                        <label class="message form-div-4">
                            <strong>Message*</strong>
                          <textarea name="message" placeholder="" data-constraints='@Required @Length(min=20,max=999999)'></textarea>
                          <span class="empty-message">*This field is required.</span>
                          <span class="error-message">*The message is too short.</span>
                        </label>
                        <!-- <label class="recaptcha"><span class="empty-message">*This field is required.</span></label> -->
                        <div class="btns">
                            <a href="#" data-type="submit" class="btn-default btn5">submit</a>
                            <p>* required fields</p>
                        </div>
                      </fieldset> 
                      <div class="modal fade response-message">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              <h4 class="modal-title">Modal title</h4>
                            </div>
                            <div class="modal-body">
                              You message has been sent! We will be in touch soon.
                            </div>      
                          </div>
                        </div>
                      </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 center">
                <ul class="follow_icon">
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-google-plus"></a></li>
                    <li><a href="#" class="fa fa-rss"></a></li>
                    <li><a href="#" class="fa fa-pinterest"></a></li>
                    <li><a href="#" class="fa fa-linkedin"></a></li>
                </ul>
            </div>
            <div class="col-lg-12 center">
                <p>84, Charing Cross Road,London<br>JL 851213-2340</p>
            </div>
            <div class="col-lg-12 center">
                <p class="privacy">&copy; <em id="copyright-year"></em> <i>|</i> <a href="index-5.php">Privacy Policy</a></p>
            </div>
        </div>
    </div>
</footer>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>

<script type="text/javascript"> 
          google_api_map_init(); 
          function google_api_map_init(){ 
            var map; 
            var coordData = new google.maps.LatLng(parseFloat(40.646197), parseFloat(-73.9724068,14)); 
            var markCoord1 = new google.maps.LatLng(parseFloat(40.643180), parseFloat(-73.9874068,14)); 
             var markCoord2 = new google.maps.LatLng(parseFloat(40.6422180), parseFloat(-73.9784068,14)); 
             var markCoord3 = new google.maps.LatLng(parseFloat(40.6482180), parseFloat(-73.9724068,14)); 
             var markCoord4 = new google.maps.LatLng(parseFloat(40.6442180), parseFloat(-73.9664068,14)); 
             var markCoord5 = new google.maps.LatLng(parseFloat(40.6379180), parseFloat(-73.9552068,14)); 
            var marker; 
 
            var styleArray = [{"featureType":"road","elementType":"geometry","stylers":[{"color":"#b1ab85"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#8cc0c3"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#cde6cf"}]},{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"color":"#efede8"}]}]
             
            var markerIcon = { 
                url: "img/gmap_marker.png", 
                size: new google.maps.Size(42, 64), 
                origin: new google.maps.Point(0,0), 
                anchor: new google.maps.Point(21, 70) 
            }; 
            function initialize() { 
              var mapOptions = { 
                zoom: 13, 
                center: coordData, 
                scrollwheel: false, 
                styles: styleArray 
              } 
 
              var contentString = "<div></div>"; 
              var infowindow = new google.maps.InfoWindow({ 
                content: contentString, 
                maxWidth: 200 
              }); 
               
              var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions); 
              marker = new google.maps.Marker({ 
                map:map, 
                position: markCoord1, 
                icon: markerIcon
              }); 

               var contentString = '<div id="content">'+
                '<div id="siteNotice">'+
                '</div>'+
                '<div id="bodyContent">'+
                '<p>4578 Marmora Road, Glasgow D04 89GR <span>800 2345-6789</span></p>'+
                '</div>'+
                '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });



            google.maps.event.addListener(marker, 'click', function() {
              infowindow.open(map,marker);
              $('.gm-style-iw').parent().parent().addClass("gm-wrapper");
            });

            google.maps.event.addDomListener(window, 'resize', function() {

              map.setCenter(coordData);

              var center = map.getCenter();
            });
          }

            google.maps.event.addDomListener(window, "load", initialize); 

          }    
</script>

</body>
</html>