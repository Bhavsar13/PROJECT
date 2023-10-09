 <section id="content">

     <div class="container">
         <div class="row">
             <div class="col-md-12">
                 <div class="about-logo">

                 </div>
             </div>
         </div>
         <div class="row">
             <div class="col-md-6">
                 <h2>Contact Details:</h2>
                 <ul>
                     <li><i class="fas fa-phone"></i> <strong>Student Support Line:</strong> +61 1300 432 218 (Available 8.00 – 20.00 AEST Monday to Friday)</li>
                     <li><i class="fas fa-phone"></i> <strong>Student Support Line India (local call):</strong> +91 880 055 9609 (Available 4.00 – 16.30 IST seven days a week)</li>
                 </ul>
                 <h3>Online Support</h3>
                 <ul>
                     <li><i class="fas fa-desktop"></i> For IT support, lodge a ticket with the help desk.</li>
                     <li><i class="fas fa-desktop"></i> For Student Support, lodge a ticket via Hub 24*7.</li>
                     <li><i class="fas fa-envelope"></i> For general support, email us (Monitored 9.00 – 17.00 AEST Monday to Friday).</li>
                 </ul>
                 <h2>Campuses</h2>
                 <ul>
                     <li><i class="fas fa-map-marker-alt"></i> <strong>ATMC Melbourne Bourke Street Campus:</strong> 470 Bourke Street, Melbourne Victoria 3000, Australia<br>Phone: +61 3 8327 3100</li>
                     <li><i class="fas fa-map-marker-alt"></i> <strong>ATMC Sydney George Street Campus:</strong> Level 9, 540 George Street, Sydney, NSW 2000, Australia<br>Phone: +61 2 9283 5233</li>
                     <li><i class="fas fa-map-marker-alt"></i> <strong>ATMC Sydney Kent Street Campus:</strong> 432 Kent Street, Sydney, NSW 2000, Australia<br>Phone: +61 2 8072 7924</li>
                 </ul>
                 <!-- Form itself -->

             </div>
             <div class="col-md-6">
                 <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
                 <div style="overflow:hidden;height:500px;width:600px;">
                     <div id="gmap_canvas" style="height:500px;width:600px;"></div>
                     <style>
                         #gmap_canvas img {
                             max-width: none !important;
                             background: none !important
                         }

                     </style><a class="google-map-code" href="http://www.trivoo.net" id="get-map-data">trivoo</a>
                 </div>
                 <script type="text/javascript">
                     function init_map() {
                         var myOptions = {
                             zoom: 14,
                             center: new google.maps.LatLng(-37.81470833279905, 144.95971016788883),
                             mapTypeId: google.maps.MapTypeId.ROADMAP
                         };
                         map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);
                         marker = new google.maps.Marker({
                             map: map,
                             position: new google.maps.LatLng(-37.81470833279905, 144.95971016788883)
                         });
                         infowindow = new google.maps.InfoWindow({
                             content: "<b>ATMC</b><br/>470 Bourke Street, Melbourne"
                         });
                         google.maps.event.addListener(marker, "click", function() {
                             infowindow.open(map, marker);
                         });
                         infowindow.open(map, marker);
                     }
                     google.maps.event.addDomListener(window, 'load', init_map);

                 </script>
             </div>
         </div>
     </div>

 </section>
