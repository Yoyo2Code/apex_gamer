$("#all-games").ready(function(){

  fetchGames();

})
 function fetchGames(){
   $.ajax({
     url:"http://localhost:3000/api/v1/games",
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
           + "'><h6>Name: "
           + Game.name
           + "</h6><p>"
           + Game.original_release_date
           + "</p>"
           + "<p>"
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
