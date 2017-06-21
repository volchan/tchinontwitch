function calc_pending_cards() {
  $('.pending-count').text(
    $('.raid-show-tags-pending-content').find('.pending-card').length
  );
};

function calc_accepted_cards() {
  $('.tanks').text(
    $('.raid-show-tags-accepted-content-tanks').children().length
  );

  $('.heals').text(
    $('.raid-show-tags-accepted-content-heals').children().length
  );

  $('.dps').text(
    $('.raid-show-tags-accepted-content-dps').children().length
  );
}

function remove_cards() {
  $('.raid-show-tags').on('click', function(event) {
    $target = event.target.className;
    $accepted = "accept fa fa-check-circle";
    $refused = "refuse fa fa-times-circle";
    $reset = "fa fa-refresh";
    $card = event.target.parentElement.parentElement.parentElement;
    if ($target == $accepted || $target == $refused) {
      $($card).slideUp('fast').remove();
      calc_pending_cards();
    } else if ($target == $reset) {
      $($card).slideUp('fast').remove();
      calc_accepted_cards();
    }
  });
};

function roster_btn_click() {
  $('#roster-btn').on('click', function() {
    console.log($(this).data('raid'));
    $.ajax({
      type: "GET",
      url: "/raids/" + $(this).data('raid') + "/show_roster_list",
      success: function(data) {
        console.log(data);
      },
      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });
};

$(document).on('ready', function() {
  calc_pending_cards();
  calc_accepted_cards();
  // remove_cards();
  roster_btn_click();
});
