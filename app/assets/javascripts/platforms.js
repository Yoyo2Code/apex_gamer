$("#all-platforms").ready(function(){

  fetchPlatforms();

})
 function fetchPlatforms(){
   $.ajax({
     url:"http://localhost:3000/api/v1/platforms",
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
           + "'><h6>Name: "
           + platform.name
           + "</h6><p>"
           + platform.original_price
           + "</p>"
           + "</div>")
      }

      function collectPlatforms( platformData ) {
        return platformData.map(createPlatformHTML);
      }

      function renderPlatforms( platformData ){
        $("#all-platforms").append( platformData )
      }
