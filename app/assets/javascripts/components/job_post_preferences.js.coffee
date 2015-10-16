# @cjsx React.DOM

@JobPostPreferences = React.createClass
  displayName: 'JobPostPreferences'
  getInitialState: ->
    didFetchData: false
    selected: {"major":[], "industry":[]}
    matches: 2
  componentDidMount: ->
    @_fetchPreferences({})
  _fetchPreferences: (data) ->
    $.ajax
      url: '/job_posts/' + @props.job_post_id + '/preferences'
      type: 'GET'
      dataType: 'json'
    .done @_fetchPreferencesDone
    .fail @_fetchPreferencesFail
  _fetchPreferencesDone: (data, textStatus, jqXHR) ->
    selected = []
    selected["major"] = data.majors
    selected["industry"] = data.industries
    @setState
      didFetchData: true
      selected: selected
  _fetchPreferencesFail: ->
    console.log "Failed to load preferences"
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
  removeElementFromArray: (array, item) ->
    index = -1
    for i in array
      if i.id == item.id
        index = array.indexOf(i)
    unless index == -1
      array.splice(index, 1)
  updateJobPostPreference: () ->
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
      {
        if @state.didFetchData
          <div>
            <div className="column large-6 small-6">
              <MajorTags majors={@state.selected["major"]} />
              <IndustryTags industries={@state.selected["industry"]} />
              {@state.matches} Students matching one or more preferences.
            </div>
            <div className="column large-6 small-6">
              <SelectTags select={"major"}
              selected_majors={@state.selected["major"]}
              selected_industries={@state.selected["industry"]}
              addSelected={@addSelected}
              removeSelected={@removeSelected} />
            </div>
          </div>
        else
          <div className="column large-12 small-12">Loading..</div>
      }
    </div>
