$(document).ready(function() {
  $('form').submit(function(event){
    event.preventDefault();
    var form_data = $(this).serialize();
    $(this).hide();
    var the_tweet = $(this).find('input[name="tweet_body"]').val();
    // console.log(the_tweet);
    $.post('/tweet', form_data, function(job_id){
      console.log(job_id);
      // check_job_status(job_id);
      check_job_status(job_id);

      // $('form').after(the_tweet);
      // $('form').slideDown();
      

    });
  });


  function check_job_status(jid){
      $.get('/status/' + jid, function(status_response){
        if (status_response.job_status === true){
          console.log("Yo, this ish is DONE");
        } else {
          console.log("STILL WORKING, stop with the questions!");
          setTimeout(check_job_status, 3000, jid);
        }
      });

  };
});
