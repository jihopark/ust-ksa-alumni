# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
  
  dropDown = [$('#toggle_school'), $('#toggle_major'),$('#toggle_industry'),$('#toggle_entrance_year'),$('#toggle_graduation_year'),$('#toggle_location')]
  resetDropDown = (count) ->  
   for i in [0..5]
     if (i!=count)
       dropDown[i].val('');
       dropDown[i].css("font-weight","normal");       
     else
       dropDown[i].css("font-weight","bold");
   
    
  user_index_path = "/users"
  result = (data) ->
  
  $('#toggle_school').on 'change', ->
    $.get(user_index_path + "?school="+this.value, result)
    resetDropDown(0)
  $('#toggle_major').on 'change', ->
    $.get(user_index_path + "?major="+this.value, result)
    resetDropDown(1)
  $('#toggle_industry').on 'change', ->
    $.get(user_index_path + "?industry="+this.value, result)
    resetDropDown(2)
  $('#toggle_entrance_year').on 'change', ->
    $.get(user_index_path + "?entrance_year="+this.value, result)
    resetDropDown(3)
  $('#toggle_graduation_year').on 'change', ->
    $.get(user_index_path + "?graduation_year="+this.value, result)
    resetDropDown(4)
  $('#toggle_location').on 'change', ->
    $.get(user_index_path + "?location="+this.value, result)  
    resetDropDown(5)	
  
  $('#user_sign_up_submit').on 'click', ->
    $('#user_email').prop('disabled', false)	
  $('.more_industries a').on 'click', (event)->
    $(this).hide()
    $(this).parent().next().show("slow")
    event.preventDefault()
  