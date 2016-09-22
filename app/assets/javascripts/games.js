$("#all-games").ready(function(){

  fetchGames();

})
 function fetchGames(){
   $.ajax({
     url:"/api/v1/games",
     type: "get",
   }).then(collectGames)
     .then(renderGames)
  //    .fail(function() {
  //   alert( "error" );
  // })
 }


      function createGamesHTML( Game ){
        return $("<div class='game' data-id='"
           + Game.id
           + "'><h6><strong>Name:</strong> "
           + Game.name
           + "</h6><p><strong>Release Date:</strong> "
           + Game.original_release_date
           + "</p>"
           + "<p><strong>For More Details:</strong> "
           + Game.site_detail_url
           + "</p>"
           + "</div>")
      }

      function collectGames( GameData ) {
        return GameData.map(createGamesHTML);
      }

      function renderGames( GameData ){
        $("#all-games").append( GameData )
      }
