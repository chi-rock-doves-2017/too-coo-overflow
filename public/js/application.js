// Commented Out for Debugging - Routes are not working and need troubleshooting before we can get JS and AJAX working

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
    
    votable_type = $("input[name=votable_type]").val();
    vote = $("input[name=vote]").val();
    votable_id = $("input[name=votable_id]").val();
    votable = $("input[name=votable").val();
    var post_url = $(this).attr("action");
    var post_data = $(this).serialize();
    debugger;

    console.log(votable_type);
    console.log(vote);
    console.log(votable_id);
    console.log(post_data);
    console.log(post_url);
    var that = this;
    $.ajax({
      url: "/votes",
      method: "POST",
      data: { vote: vote, votable_type: votable_type, votable_id: votable_id}
    })
  
    .done(function(response) {
      console.log("I am here inside done");
      console.log(response);
      debugger;
      var response = $(response);

      var vote_counted = response[15].firstElementChild.children[1].innerHTML;
      $(that).find(".upvote-button").css("color", "red");
      //       
      $(that).parents('.votes-container').children('#vote_count').text(vote_counted);

      debugger;

      /** need to update 7/2 saham */
      /**location.reload(true)*/
    })
   }) 
};
