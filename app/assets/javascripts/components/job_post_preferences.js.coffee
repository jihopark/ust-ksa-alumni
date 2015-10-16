# @cjsx React.DOM

@JobPostPreferences = React.createClass
  displayName: 'JobPostPreferences'
  getInitialState: ->
    didFetchData: false
    selected: {"major":[], "industry":[]}
    matches: 2
  addSelected: (item, select) ->
    array = @state.selected[select]
    array.push(item)
    dictionary = @state.selected
    dictionary[select] = array
    @setState
      selected: dictionary
    @updateJobPostPreference()
  removeSelected: (item, select) ->
    array = @state.selected[select]
    @removeElementFromArray(array, item)
    dictionary = @state.selected
    dictionary[select] = array
    @setState
      selected: dictionary
    @updateJobPostPreference()
  isSelected: (item, select) ->
    @state.selected[select].indexOf(item) != -1
  removeElementFromArray: (array, item) ->
    i = array.indexOf(item)
    unless i == -1
      array.splice(i, 1)
  updateJobPostPreference: () ->
    console.log JSON.stringify {"majors": @state.selected["major"], "industries": @state.selected["industry"]}

    $.ajax
      url: '/job_posts/' + @props.job_post_id + '/update_preferences'
      type: 'PUT'
      dataType: 'json'
      contentType: 'application/json'
      data:
        JSON.stringify {"majors": @state.selected["major"], "industries": @state.selected["industry"]}
    .done @_updateSuccess
    .fail @_updateFailure
  _updateSuccess: () ->
    console.log "Success"
  _updateFailure: () ->
    console.log "Fail"
  render: ->
    <div id="JobPostPreferences" className="row">
      <div className="column large-6 small-6">
        <MajorTags majors={@state.selected["major"]} />
        <IndustryTags industries={@state.selected["industry"]} />
        {@state.matches} Students matching one or more preferences.
      </div>

      <div className="column large-6 small-6">
        <SelectTags select={"major"}
        isSelected={@isSelected}
        selected_majors={@state.selected["major"]}
        selected_industries={@state.selected["industry"]}
        addSelected={@addSelected}
        removeSelected={@removeSelected} />
      </div>
    </div>
