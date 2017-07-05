$(document).ready(function() {
  logOutListener();
  

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

var votelistener = function () {
  
  $(".upvote").submit(function(event){
    console.log("iam here"); 

    event.preventDefault();
    votable_type = $("input[name=votable_type]");
    vote = $("input[name=vote]");
    votable_id = $("input[name=votable_id]")
    console.log(votable_type.val());
    console.log(vote.val());
    console.log(votable_id.val());
    debugger
    $.ajax({
      url: "/votes",
      method: "POST",
      data: { vote: vote.val(), votable_type: votable_type.val(), votable_id: votable_id.val()}
    })
    .done(function(vote_count) {
      $('.vote_container').html("where am i now")
      /** need to update 7/2 saham */
      /**location.reload(true)*/
    })
   }) 
}