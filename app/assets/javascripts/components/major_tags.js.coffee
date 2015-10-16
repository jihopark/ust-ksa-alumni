# @cjsx React.DOM

@MajorTags = React.createClass
  displayName: 'MajorTags'
  render: ->
    majorTags = @props.majors.map (major) ->
      <PreferenceTag key={"major_"+major.id}, name={major.name}, category="major" />
    <div className="major_tags">
      <h5>Selected Majors</h5>
      {
        if @props.majors.length > 0
            {majorTags}
        else
          <h7 className="small">Add majors on the right</h7>
      }
    </div>
