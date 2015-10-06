# @cjsx React.DOM

@JobPostPreferences = React.createClass
  displayName: 'JobPostPreferences'
  getInitialState: ->
    didFetchData: false
    majors: [{name:"CS", id:1}, {name:"Psycho", id:2}]
    industries: []
    graduation_years: []
    select: "major"
    matches: 2
  sample_data:
      [{id: 1, name: "hello"}, {id: 2, name: "byebye"}]
  render: ->
    <div id="JobPostPreferences" className="row">
      <div className="column large-6 small-6">
        <MajorTags majors={@state.majors} />
        <IndustryTags industries={@state.industries} />
        {@state.matches} Students matching one or more preferences.

      </div>

      <div className="column large-6 small-6">
        <SelectTags select={@state.select}, data={@sample_data} />
      </div>
    </div>
