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
    # have ajax call hrere
  removeSelected: (item, select) ->
    array = @state.selected[select]
    @removeElementFromArray(array, item)
    dictionary = @state.selected
    dictionary[select] = array
    @setState
      selected: dictionary
    # have ajax call hrere
  removeElementFromArray: (array, item) ->
    i = array.indexOf(item)
    unless i == -1
      array.splice(i, 1)
  render: ->
    <div id="JobPostPreferences" className="row">
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
