$("#all-platforms").ready(function(){

  fetchPlatforms();

})
 function fetchPlatforms(){
   $.ajax({
     url:"/api/v1/platforms",
     type: "get",
   }).then(collectPlatforms)
     .then(renderPlatforms)
  //    .fail(function() {
  //   alert( "error" );
  // })
 }


      function createPlatformHTML( platform ){
        return $("<div class='platform' data-id='"
           + platform.id
           + "'><h6><strong>Name:</strong> "
           + platform.name
           + "</h6><p><strong>Original Price:</strong> "
           + platform.original_price
           + "</p><p><strong>Units Sold:</strong> "
           + platform.install_base
           + "</p><p><strong>Total Revenue:</strong> "
           + platform.total_revenue
           + "</p><p><strong>Release Date:</strong> "
           + platform.release_date
           + "</p>"
           + "</div>")
      }

      function collectPlatforms( platformData ) {
        return platformData.map(createPlatformHTML);
      }

      function renderPlatforms( platformData ){
        $("#all-platforms").append( platformData )
      }
;
