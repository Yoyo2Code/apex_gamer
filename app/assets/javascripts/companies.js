$("#all-companies").ready(function(){

  fetchCompanies();

})
 function fetchCompanies(){
   $.ajax({
     url:"/api/v1/companies",
     type: "get",
     success: function(data){
       console.log(data)
     }
   }).then(collectCompanies)
     .then(renderCompanies)
    //  .fail(function() {
    //    alert( "error" );
    //  })
 }


      function createCompaniesHTML( company ){
        return $("<div class='company' data-id='"
           + company.id
           + "'><h6><strong>Name:</strong> "
           + company.name
           + "</h6><p><strong>Location:</strong> "
           + company.location_country
           + "</p>"
           + "<p><strong>Date Founded:</strong> "
           + company.date_founded
           + "</p>"
           + "</div>")
      }

      function collectCompanies( companyData ) {
        return companyData.map(createCompaniesHTML);
      }

      function renderCompanies( companyData ){
        $("#all-companies").append( companyData )
      }
