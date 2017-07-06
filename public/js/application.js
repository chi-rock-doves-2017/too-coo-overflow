$(document).ready(function() {
  logOutListener();
  voteListener()
  

});


var logOutListener = function () {
  $(".logout").on("click", function (event) {
    event.preventDefault()
    $.ajax({
      url: "/sessions",
      method: "POST",
      data: {_method: 'DELETE'}
    })
    .done(function () {
      location.reload(true)
    })
    .fail(function () {
      location.reload(true)
    })
  })
};

var voteListener = function () {
  
  $(".upvote").submit(function(event){
    console.log("iam here"); 
    console.log(this);


    event.preventDefault();
    debugger;
    votable_type = $("input[name=votable_type]").val();
    vote = $("input[name=vote]").val();
    votable_id = $("input[name=votable_id]").val();
    votable = $("input[name=votable").val();
    var post_url = $(this).attr("action");

    console.log(votable_type);
    console.log(vote);
    console.log(votable_id);
    var that = this;
    $.ajax({
      url: "/votes",
      method: "POST",
      dataType: "Json",
      data: { vote: vote, votable_type: votable_type, votable_id: votable_id, votable}
    })
  
    .done(function(vote) {
      console.log("I am here inside done");
      console.log(vote);
      debugger;
      $(that).find(".upvote-button").css("color", "red");
      
      // $(that).find("#vote_count").text('vote_count(votable)')
      debugger;

      /** need to update 7/2 saham */
      /**location.reload(true)*/
    })
   }) 
};
