# @cjsx React.DOM

@JobPostPreferences = React.createClass
  displayName: 'JobPostPreferences'
  getInitialState: ->
    didFetchData: false
    selected_majors: [{name:"CS", id:1}, {name:"Psycho", id:2}]
    selected_industries: []
    graduation_years: []
    matches: 2
  render: ->
    <div id="JobPostPreferences" className="row">
      <div className="column large-6 small-6">
        <MajorTags majors={@state.selected_majors} />
        <IndustryTags industries={@state.selected_industries} />
        {@state.matches} Students matching one or more preferences.
      </div>

      <div className="column large-6 small-6">
        <SelectTags select={"major"} />
      </div>
    </div>
