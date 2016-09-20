$(document).ready(function(){

  fetchPlatforms();

})

 function fetchPlatforms(){
   $.ajax({
     url:"https://localhost:3000/api/v1/platforms",
     type: "get",
   }).then(collectPlatforms)
     .then(renderPlatforms)
 }

      function collectPlatforms( platformData ) {
        return platformData.map(createPlatformHTML);
      }

      function renderPlatforms( platformData ){
        $("#all-platforms").append(platformData)
      }
